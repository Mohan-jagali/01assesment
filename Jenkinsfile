pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Mohan-jagali/Assessment01'
            }
        }
        stage('Build Backend') {
            steps {
                sh 'docker build -t assessment01-backend:latest ./backend'
            }
        }
        stage('Build Frontend') {
            steps {
                sh 'docker build -t assessment01-frontend:latest ./frontend'
            }
        }
        stage('Deploy with Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
