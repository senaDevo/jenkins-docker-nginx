pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('jenkins-training:latest')
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run --rm -d -p 8081:80 jenkins-training:latest'
                echo "Aceda a http://localhost:8081 para ver a página"
            }
        }
    }
    post {
        always {
            sh 'docker container prune -f || true'
            sh 'docker image prune -f || true'
        }
    }
}
