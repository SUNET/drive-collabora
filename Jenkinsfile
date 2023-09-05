pipeline {
    agent any
    stages {
        stage('Git') {
            agent {
              node {
                customWorkspace '/home/jenkins/workspace/drive-collabora'
              }
            }
            steps {
                sh 'git clone https://github.com/SUNET/drive-collabora build'
            }
        }
        stage('Build') {
            agent {
              dockerfile {
                filename 'Dockerfile'
                dir 'build'
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
