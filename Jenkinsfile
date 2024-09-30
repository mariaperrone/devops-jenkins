pipeline {
    agent any

    stages {
        stage('Run Docker Hello World') {
            steps {
                script {
                    sh 'docker pull hello-world'
                    sh 'docker run hello-world'
                }
            }
        }
    }

    post {
        success {
            echo '¡La ejecución fue exitosa!'
        }
        failure {
            echo 'La ejecución falló.'
        }
    }
}
