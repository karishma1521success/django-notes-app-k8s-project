pipeline{
    agent any 

    environment {
            ENV = "prod"
            GIT_URL = "https://github.com/karishma1521success/django-notes-app-k8s-project.git"
            DOCKER_IMAGE = "django_docker_image"

    }

    stages{
        stage('Checkout'){
            steps{
                echo "This is a Checkout stage"
                // git url: '$GIT_URL' branch: 'main' 
                Checkout scm
            }
        }
        stage('Build'){
            steps{
                echo "This is a Build stage"
                sh 'whoami'
                sh 'docker build -t $DOCKER_IMAGE:latest .'
                sh 'docker images'
            }
        }
        stage('Push Image to Docker Hub'){
            steps{
                echo "This is a push to dockerhub stage"
                withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CRED' , usernameVariable: 'DOCKERHUB_USERNAME' , passwordVariable: 'DOCKERHUB_PASSWORD')])
                sh '''
                docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD
                docker tag $DOCKER_IMAGE:latest $DOCKERHUB_USERNAME/$DOCKER_IMAGE:latest
                docker push $DOCKERHUB_USERNAME/$DOCKER_IMAGE:latest
                '''
            }
        }
        stage('deploy'){
            steps{
                echo "This is a deploy stage"
            }
        }
        stage('update k8s yaml manifest'){
            steps{
                echo "This is a yaml manifest stage"
            }
        }
    }
}