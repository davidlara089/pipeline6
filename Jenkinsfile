pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH" // Agrega Docker al PATH de Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "main", url: 'https://github.com/davidlara089/pipeline6.git'
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

        stage('Test') {
            steps {
                script {
                    def result = sh(script: 'grep -q "mostrarEnConsola()" holamundo.java', returnStatus: true)
                    if (result != 0) {
                        error('Method mostrarEnConsola() not found in holamundo.java')
                    } else {
                        echo 'Method mostrarEnConsola() found in holamundo.java'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '5e476a4f-7c6f-4bff-9f70-4a0a9440a4e9') {
                        def dockerImage = docker.build("davelara089/pipelinedocker:${env.BUILD_NUMBER}")
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
