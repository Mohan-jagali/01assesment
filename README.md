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

       
3. NGINX Configuration
  -  Ensure the nginx.conf file 
       - It routes traffic:
           - /api → Backend (Go application)
           - / → Frontend (static app) 

4. Docker Compose (Optional)
   - Use Docker Compose to bring up the entire stack:
   - docker-compose up --build
   - Access the services:
     - Frontend: http://localhost
     - Backend: http://localhost/api/

5. CI/CD with Jenkins
  - Configure Jenkins:
    -  Create a new pipeline project.
    -  use the provided Jenkinsfile.
  - Pipeline Workflow:
    -  Build and Test:
       - Backend: Compiles the Go application .
       - Frontend: Validates HTML 
    -  Build Docker Images: Builds backend and frontend Docker images.
    -  Deploy Infrastructure: Runs terraform apply to deploy containers.


6. Terraform Infrastructure:
   - Navigate to the terraform directory:
     - cd terraform			
   - Initialize Terraform:
     - terraform init 
   - Apply the configuration
     - terraform apply
   - This will provision:
     - A Go backend container.
     - A static frontend container.
     - An NGINX reverse proxy container.

7. Endpoints
   - Frontend:
     - Accessible at http://localhost
     - Serves static content (e.g., index.html).

   - Backend:
     - Accessible at http://localhost/api
     - Responds with "Hello, World" 

8. Troubleshooting
   - Port Conflicts:
   -If you encounter "port already allocated" errors:
    - Stop conflicting services

9. Docker Image Not Found:
  - Ensure you build images before applying Terraform
  - check jenkims file image tag and terraform main file image tag both has same image tag before build

10. Nginx conflict:
    - if you encounter a problem related volume mounts make sure you have given the correct absolute path.
