# Local CI/CD and Containerized Application Deployment

This project demonstrates setting up a local infrastructure for deploying a containerized Go backend and a static frontend application using Terraform, Docker, and Jenkins. It includes a reverse proxy (NGINX) and CI/CD pipeline integration with Jenkins.
## **Prerequisites**
1. **Install the following tools:**
   - [Docker](https://www.docker.com/)
   - [Terraform](https://www.terraform.io/)
   - [Jenkins](https://www.jenkins.io/)
   - Optional: [Docker Compose](https://docs.docker.com/compose/)

2. **Set up Jenkins:**
   - Install Jenkins on your local machine.
   - Install the following plugins:
     - Docker
     - Pipeline
     - Terraform

Terraform Infrastructure
Navigate to the terraform directory
cd terraform
Initialize Terraform:
terraform init
Apply the configuration
This will provision:
A Go backend container.
A static frontend container.
An NGINX reverse proxy container.

3.Docker Compose (Optional)
Use Docker Compose to bring up the entire stack:

docker-compose up --build
Access the services:
Frontend: http://localhost
Backend: http://localhost/api


