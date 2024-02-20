pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch:'main' 'https://github.com/valentin-th/TP20022024.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('image:latest', '-f Dockerfile .')
                }
            }
        }
    }
}