pipeline {
    agent any

    environment {
        registry = "davelara089/pipelinedocker"
        registryCredential = '913e0b95-740c-4c33-b72e-859ca4957541'
        dockerImage = ''
        SCANNER_HOME = tool 'sonarqube'  // sonar-scanner is the name of the tool in the manage jenkins> tool configuration
    }

    stages {
        stage('Checkout') {
            steps {
                // Clona el repositorio desde GitHub
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }

        stage('Compile') {
            steps {
                script {
                    // Verifica si el archivo holamundo.java existe
                    if (fileExists('holamundo.java')) {
                        echo 'Compilando holamundo.java'
                        // Compila el archivo Java
                        sh 'javac holamundo.java'
                    } else {
                        error 'Archivo holamundo.java no encontrado'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Busca el método mostrarEnConsola en holamundo.java
                    def result = sh(script: 'grep -q "mostrarEnConsola()" holamundo.java', returnStatus: true)
                    if (result != 0) {
                        error('Método mostrarEnConsola() no encontrado en holamundo.java')
                    } else {
                        echo 'Método mostrarEnConsola() encontrado en holamundo.java'
                    }
                }
            }
        }

        stage('Building Image') {
            steps {
                script {
                    dockerImage = docker.build("${registry}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
