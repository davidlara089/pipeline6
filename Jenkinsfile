pipeline {
    agent any
    
    stages {
        stage('Git Pull') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/davidlara089/pipeline6.git'
                }
            }
        }
        stage('Check for index.html') {
            steps {
                script {
                    def exists = fileExists('index.html')
                    if (exists) {
                        echo 'El archivo index.html existe.'
                    } else {
                        error 'El archivo index.html no existe.'
                    }
                }
            }
        }
    }
}
