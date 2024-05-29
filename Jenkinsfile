pipeline {
    agent any
    environment {
        appName = "variable"
    }
    stages {
        stage('Paso 1 lectura de parametros') {
            steps {
                script {
                    sh "echo 'hola mundo desde GIT'"
                    sh "pwd"
                    sh "ls -ltr"
                }
            }
        }
        stage('paso 2 - Compilacion de codigo') {
            steps {
                script {
                    sh "echo 'COMPILANDO CODIGO'"
                    sh 'pwd'
                    sh 'ls -ltr'
                    sh 'javac holamundo.java'
                    sh 'ls -ltr'
                    sh 'sleep 5'
                    sh 'jar -cf holamundo.jar HolaMundo.class'
                    sh 'ls -ltr'
                    sh 'java -jar holamundo.jar'
                    sh 'ls -ltr'
                    sh 'java -jar holamundo.jar'
                    sh "echo 'compilacion exitosa'"
                    sh 'cp holamundo.jar /tmp/'
                }
            }
        }
    }

    post {
        always {
            sh "echo 'Siempre se ejecuta sin importar si fue fallido o no'"
            sh 'ls -ltr'
        }
        success {
            echo 'Pipeline completed successfully!'
            sh "ls -ltr"
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
