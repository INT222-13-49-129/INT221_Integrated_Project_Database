pipeline {
    agent any

    stages {

        stage('stop and remove container, image') {
            steps {
                sh 'docker stop database'
                sh 'docker rm database'
                sh 'docker image rm database'
            }
        }

        stage('remove whole data') {
            steps {
                sh 'rm -rf *'
            }
        }

        stage('git clone') {
            steps {
                git branch: 'master',
                    credentialsId: 'int222',
                    url: 'https://github.com/INT222-13-49-129/INT222_Integrated_Project_Database.git'
            }
        }

        stage('(deploy) start contianer') {
            steps {
                sh 'docker-compose up -d'
            }
        }

    }
}
