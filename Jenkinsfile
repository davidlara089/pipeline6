pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }

        stage('Compile') {
            steps {
                script {
                    if (fileExists('holamundo.java')) {
                        echo 'Compiling HolaMundo.java'
                        sh 'javac holamundo.java'
                    } else {
                        error 'File HolaMundo.java not found'
                    }
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    if (fileExists('holamundo.class')) {
                        echo 'Running HolaMundo'
                        sh 'java holamundo'
                    } else {
                        error 'File holamundo.class not found'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                currentBuild.result = 'FAILURE'
            }
        }

        success {
            script {
                currentBuild.result = 'SUCCESS'
            }
        }
    }
}

