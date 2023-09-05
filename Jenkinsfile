pipeline {
    agent { dockerfile }
    stages {
        stage('Build') {
            agent {
              dockerfile {
                filename 'Dockerfile'
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
