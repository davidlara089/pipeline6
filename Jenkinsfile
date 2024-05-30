pipeline {
    agent any

    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
            }
        }
        stage('List Files') {
            steps {
                script {
                    // Listar archivos en el directorio para verificar qué archivos existen
                    sh 'ls -la'
                }
            }
        }
        stage('Check for index.html') {
            steps {
                script {
                    // Verificación de existencia de archivo
                    if (fileExists('index.html')) {
                        echo 'El archivo index.html existe.'
                    } else {
                        echo 'El archivo index.html no existe.'
                    }
                }
            }
        }
    }
}
