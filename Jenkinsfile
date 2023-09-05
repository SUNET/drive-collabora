pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            agent {
              dockerfile {
                reuseNode true
              }
            }
            environment {
                COLLABORA_URL_FRAGMENT = credentials('COLLABORA_URL_FRAGMENT')
            }
            steps {
                sh 'echo "Fetching secret from env"'
            }
        }
    }
}
