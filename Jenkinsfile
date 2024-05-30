pipeline {
    agent any

    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }
        stage('Check for index.html') {
            steps {
                script {
                    if (fileExists('index.html')) {
                        echo 'El archivo index.html existe.'
                    } else {
                        echo 'El archivo index.html no existe.'
                    }
                }
            }
        }
        stage('Compile') {
            steps {
                script {
                    if (fileExists('holamundo.java')) {
                        echo 'Compiling holamundo.java'
                        sh 'javac holamundo.java'
                    } else {
                        error 'holamundo.java no encontrado.'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    try {
                        sh 'grep -q "mostrarEnConsola()" holamundo.java'
                        echo 'Método mostrarEnConsola() encontrado en holamundo.java'
                    } catch (Exception e) {
                        error 'Método mostrarEnConsola() no encontrado en holamundo.java'
                    }
                }
            }
        }
    }
}
