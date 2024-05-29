pipeline {
    environment {
        registry = "davelara089/pipelinedocker"
        registryCredential = 'cf0e37c1-bb1f-4cee-a617-561868f13486'
        dockerImage = ''
    }
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clona el repositorio desde GitHub
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }

        stage('Sonarqube Analysis') {
            environment {
                SCANNER_HOME = tool 'sonarqube'  // sonar-scanner is the name of the tool in the manage jenkins> tool configuration
            }
            steps {
                withSonarQubeEnv(installationName: 'sonarqube') {  // installationName is the name of sonar installation in manage jenkins>configure system
                    sh "${SCANNER_HOME}/bin/sonar-scanner \
                        -Dsonar.projectKey=node-api-testing \
                        -Dsonar.token=sqp_4239b0abadae0ed7a4712e4eac5a8e03b94e1762 \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.inclusions=holamundo.java \
                        -Dsonar.test.inclusions=holamundo.java"
                }
            }
        }

        stage('Compile') {
            steps {
                script {
                    // Verifica si el archivo holamundo.java existe
                    if (fileExists('holamundo.java')) {
                        echo 'Compiling holamundo.java'
                        // Compila el archivo Java
                        sh 'javac holamundo.java'
                    } else {
                        error 'File holamundo.java not found'
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
                        error('Method mostrarEnConsola() not found in holamundo.java')
                    } else {
                        echo 'Method mostrarEnConsola() found in holamundo.java'
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
