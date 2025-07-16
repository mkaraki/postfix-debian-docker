pipeline{
    agent any
    stages {
        stage('build docker image') {
            steps {
                sh '''
                docker build -t cr01.mkarakiapps.com/mkaraki/postfix:latest .
                '''
            }
        }
        stage('push docker image') {
            steps {
                sh '''
                docker push cr01.mkarakiapps.com/mkaraki/postfix:latest
                '''
            }
        }
    }
}
