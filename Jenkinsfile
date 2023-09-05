pipeline {
    agent {
      dockerfile {
        filename 'Dockerfile'
        dir 'build'
      }
    }
    stages {
        stage('Git') {
            steps {
                sh 'git clone https://github.com/SUNET/drive-collabora build'
            }
        }
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
