pipeline {
    agent any

    environment {
        IMAGE_NAME = "gsenacosta/jenkins-training-web"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Garante que o código da página é obtido do repositório
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Constroi a imagem Docker
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Opcional: faz login no Docker Hub (necessário configurar credenciais no Jenkins)
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                // Executa o container localmente para teste
                sh "docker run --rm -d -p 8080:80 ${IMAGE_NAME}:${IMAGE_TAG}"
                echo "Aceda a http://localhost:8080 para ver a página"
            }
        }
    }

    post {
        always {
            // Limpa imagens paradas e containers após execução
            sh "docker system prune -f || true"
        }
    }
}
