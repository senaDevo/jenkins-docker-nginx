pipeline {
    agent any

    environment {
        IMAGE_NAME = "gsenacosta/jenkins-training-web"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'my-docker-token') {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run --rm -d -p 8081:80 ${IMAGE_NAME}:${IMAGE_TAG}"
                echo "Aceda a http://localhost:8081 para ver a página"
            }
        }
    }

    post {
        always {
            echo 'Cleaning up Docker artifacts...'
            sh "docker container prune -f || true"
            sh "docker image prune -f || true"
        }
    }
}
