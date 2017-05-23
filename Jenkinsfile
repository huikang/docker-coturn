pipeline {
    agent {
        node { label 'slave_9_47_161_2' }
    }
    stages {
        stage('build') {
            steps {
                sh 'make'
            }
        }
    }
}
