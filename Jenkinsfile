pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }

        stage('Compile Java Code') {
            steps {
                echo 'Starting Java code compilation'
                sh 'which javac'
                sh 'javac holamundo.java'
                echo 'Java code compilation finished'
            }
        }

        stage('Run Python Code') {
            steps {
                echo 'Running Python code'
                sh 'which python3'
                sh 'python3 Programa.py'
            }
        }

        stage('Test') {
            steps {
                script {
                    def result = sh(script: 'grep -q "showInConsole()" holamundo.java', returnStatus: true)
                    if (result != 0) {
                        error('Method showInConsole() not found in holamundo.java')
                    } else {
                        echo 'Method showInConsole() found in holamundo.java'
                    }
                }
            }
        }

        stage('Run Java Code') {
            steps {
                echo 'Running Java program'
                sh 'java holamundo'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
            currentBuild.result = 'FAILURE'
        }
        success {
            echo 'Pipeline succeeded.'
            currentBuild.result = 'SUCCESS'
        }
    }
}
