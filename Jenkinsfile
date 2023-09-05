pipeline {
    agent any
    stages {
        stage('Build') {
            environment {
                COLLABORA_URL_FRAGMENT = credentials('COLLABORA_URL_FRAGMENT')
            }
            steps {
                sh 'echo "Cloninge from git"'
                sh 'git clone https://github.com/SUNET/drive-collabora build'
                sh 'docker build ./build'
            }
        }
    }
}
