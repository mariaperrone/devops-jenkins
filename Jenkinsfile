pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/mariaperrone/devops-jenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mi-jupyterlab .'
                }
            }
        }
        stage('Run JupyterLab Container') {
            steps {
                script {
                    sh 'docker run -d -p 8888:8888 --name jupyterlab mi-jupyterlab'
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
        always {
            script {
                sh 'docker stop jupyterlab || true'
                sh 'docker rm jupyterlab || true'
            }
            cleanWs()
        }
    }
}

