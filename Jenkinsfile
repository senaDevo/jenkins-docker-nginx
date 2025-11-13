Replace your Jenkinsfile to:
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
        sh 'docker run --rm jenkins-training:latest'
      }
    }
  }
}

