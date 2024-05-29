pipeline {
    environment {
        registry = "davelara089/pipelinedocker:tag"
        registryCredential = '5e476a4f-7c6f-4bff-9f70-4a0a9440a4e9'
        dockerImage = ''
    }
    agent any  
    stages {
        stage('Install Docker') {
            steps {
                sh 'apt-get update'
                sh 'apt-get -y install docker.io'
            }
        }
        
        stage('Checkout') {
            steps {
                // Clona el repositorio desde GitHub
                git branch: "main", url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }

        stage('Compile') {
            steps {
                script {
                    // Verifica si el archivo HolaMundo.java existe
                    if (fileExists('holamundo.java')) {
                        echo 'Compiling HolaMundo.java'
                        // Compila el archivo Java
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
                    // Busca el método showInConsole en holamundo.java
                    def result = sh(script: 'grep -q "mostrarEnConsola()" holamundo.java', returnStatus: true)
                    if (result != 0) {
                        error('Method mostrarEnConsola() not found in holamundo.java')
                    } else {
                        echo 'Method mostrarEnConsola() found in holamundo.java'
                    }
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        // Tag y push de la imagen Docker
                        dockerImage = docker.build(registry)
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
