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

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("davelara089/pipelinedocker:${env.BUILD_NUMBER}", "-f Dockerfile .")
                }
            }
        }

        // Agrega otros pasos del pipeline aquí...

    }
}
