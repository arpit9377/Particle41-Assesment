provider "aws" {
  region = "ap-south-1b"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "app" {
  ami           = "ami-00bb6a80f01f03502" 
  instance_type = "t2.micro"
  security_groups = [aws_security_group.app_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker git
    systemctl start docker
    systemctl enable docker
    docker run -d -p 8080:8080 arpit3004/simpletimeservice
  EOF
}

resource "aws_security_group" "app_sg" {
  name = "app_sg"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

