pipeline {
    agent any

    stages {
        stage('Git Pull') {
            steps {
                // Obtener los cambios del repositorio git
                git branch: 'main', url: 'https://tu-repo.git'
            }
        }
        stage('Check for index.html') {
            steps {
                script {
                    if (fileExists('index.html')) {
                        echo 'El archivo index.html existe.'
                        // Aquí puedes agregar más acciones si el archivo existe
                    } else {
                        echo 'El archivo index.html no existe.'
                        // Aquí puedes agregar más acciones si el archivo no existe
                    }
                }
            }
        }
        // Aquí puedes agregar más etapas según tus necesidades
    }
}
