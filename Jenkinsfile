pipeline {
    agent any
    stages {
        stage('Build') {
            environment {
                COLLABORA_URL_FRAGMENT = credentials('COLLABORA_URL_FRAGMENT')
            }
            steps {
                sh 'echo "Fetching secret from env"'
            }
        }
    }
}
