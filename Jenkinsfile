pipeline {
    agent any

    stages {
        stage('Git Pull') {
            steps {
                script {
                    // Obtener los cambios del repositorio git
                    git 'pull'
                }
            }
        }
        stage('Check for index.html') {
            steps {
                script {
                    def indexExists = fileExists('index.html')
                    if (indexExists) {
                       sh "echo 'El archivo index.html existe.'"
                        // Aquí puedes agregar más acciones si el archivo existe
                    } else {
                        sh "echo 'El archivo index.html no existe.'"
                        // Aquí puedes agregar más acciones si el archivo no existe
                    }
                }
            }
        }
        // Aquí puedes agregar más etapas según tus necesidades
    }
}

def fileExists(String filePath) {
    def file = new File(filePath)
    return file.exists()
}
