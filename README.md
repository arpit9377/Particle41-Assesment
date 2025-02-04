# SimpleTimeService

## Overview
SimpleTimeService is a minimalist web service that returns the current timestamp and the requester's IP address in JSON format. This service is containerized using Docker and deployed using Terraform.

## Features
- Returns JSON response with timestamp and IP address.
- Containerized using Docker.
- Deployable to AWS using Terraform.

## Prerequisites
Ensure you have the following installed:
- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Git**: [Install Git](https://git-scm.com/downloads)
- **Terraform**: [Install Terraform](https://developer.hashicorp.com/terraform/downloads)
- **AWS CLI**: [Install AWS CLI](https://aws.amazon.com/cli/)

## Running Locally
### Clone the Repository
```sh
 git clone https://github.com/yourusername/your-repo.git
 cd your-repo
```

### Build and Run Docker Container
```sh
cd app
# Build the Docker Image
docker build -t simple-time-service .

# Run the Docker Container
docker run -p 8080:8080 simple-time-service
```

### Test the API
Open your browser or use **cURL**:
```sh
curl http://localhost:8080/
```
Expected Response:
```json
{
  "timestamp": "2025-02-04T12:00:00Z",
  "ip": "127.0.0.1"
}
```

---
## Deploying to AWS using Terraform

### Configure AWS Credentials
```sh
aws configure
```
Provide your AWS access key, secret key, region, and output format.

### Initialize Terraform
```sh
cd terraform
terraform init
```

### Plan the Infrastructure
```sh
terraform plan
```

### Apply the Infrastructure
```sh
terraform apply -auto-approve
```

### Verify Deployment
Find the **Load Balancer URL** from the Terraform output:
```sh
echo "Deployment Successful! Access the service at: http://your-load-balancer-url"
```
Test it using cURL:
```sh
curl http://your-load-balancer-url/
```

## Repository Structure
```
.
├── app               # Application files and Dockerfile
│   ├── main.py       # Example Python service (modify as needed)
│   ├── Dockerfile
│   └── requirements.txt
└── terraform         # Terraform infrastructure setup
    ├── main.tf
    
```

## Notes
- The application **does not** run as root inside the container.
- Secrets (AWS keys, API keys) **must not** be pushed to GitHub.


