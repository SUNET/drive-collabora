pipeline {
    agent {
      dockerfile true
      dir 'build'
      registryUrl 'https://docker.sunet.se/'
      registryCredentialsId 'DOCKER_CREDENTAILS'
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
