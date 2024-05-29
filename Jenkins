pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clona el repositorio desde GitHub
                git branch:"main", url: 'https://github.com/davidlara089/pipeline6.git'
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

        stage('Run') {
            steps {
                script {
                    // Verifica si el archivo HolaMundo.class fue generado
                    if (fileExists('HolaMundo.class')) {
                        echo 'Running HolaMundo'
                        // Ejecuta el programa Java compilado
                        sh 'java HolaMundo'
                    } else {
                        error 'File HolaMundo.class not found'
                    }
                }
            }
        }
    }
}
