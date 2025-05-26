pipeline {
    agent any

    environment {
        IMAGE_NAME = "HelloExpress/node-app"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Pradumanrawat/basic-node.js-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy (Optional)') {
            steps {
                // Optional: Run container after pushing
                sh 'docker stop node-app || true'
                sh 'docker rm node-app || true'
                sh 'docker run -d --name node-app -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}
