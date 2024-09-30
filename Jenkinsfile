pipeline {
    agent {
        docker {
            image 'jupyter/scipy-notebook:latest'
            args '-p 8888:8888'
        }
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/mariaperrone/devops-jenkins.git'
            }
        }
        stage('Run Jupyter Notebook') {
            steps {
                script {
                    sh 'jupyter notebook --no-browser --ip=0.0.0.0 --allow-root'
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
            cleanWs()
        }
    }
}
