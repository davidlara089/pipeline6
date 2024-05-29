pipeline {
    agent any

    stages {
        stage('Integration') {
            steps {
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git/holamundo.java'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.image('python:3.8-slim').inside {
                        sh 'python --version'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('python:3.8-slim').inside {
                        sh 'pip install unittest'
                        sh 'python -m unittest discover -s .'
                    }
                }
            }
        }

        stage('Deploy') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                script {
                    def imageName = 'davelara089/holamundo:latest'
                    docker.build(imageName)
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials-id') {
                        docker.image(imageName).push()
                    }
                }
            }
        }
    }

    post {
        failure {
            mail to: 'laradave374@gmail.com',
                 subject: "Pipeline falló: ${currentBuild.fullDisplayName}",
                 body: "Algo salió mal en la construcción del proyecto ${env.JOB_NAME} #${env.BUILD_NUMBER}\nRevisar logs en ${env.BUILD_URL}"
        }
    }
}
