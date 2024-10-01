pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mi_jupyterbook' 
        CONTAINER_NAME = 'jupyterbook_container'
        PORT = '8000'
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                git branch: 'main', url: 'https://github.com/mariaperrone/devops-jenkins.git'
            }
        }

        stage('Construir Imagen Docker') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Levantar Contenedor JupyterBook') {
            steps {
                script {
                    sh """
                        if [ \$(docker ps -a -q -f name=${CONTAINER_NAME}) ]; then
                            docker stop ${CONTAINER_NAME} || true
                            docker rm ${CONTAINER_NAME} || true
                        fi
                    """
                    sh """
                        docker run -d --name ${CONTAINER_NAME} -p ${PORT}:8000 ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Verificar Contenedor') {
            steps {
                script {
                    sh "docker ps | grep ${CONTAINER_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo 'El contenedor de JupyterBook se levantó correctamente.'
        }
        failure {
            echo 'Error: La pipeline falló.'
        }
    }
}
