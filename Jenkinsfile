pipeline {
    agent any 
    stages {
        stage('Compile and Clean') { 
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Creating build') { 
            
            steps {
                sh "mvn package -DskipTests"
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Building Docker Image"
                sh 'ls'
                sh 'docker build -t onetrip/backend_app .'
            }
        }
        stage('Docker deploy'){
            steps {
                sh "docker stop onetrip/backend_app || true"
                sh "docker rm onetrip/backend_app || true"
                sh "docker run -itd -p 9000:9000 --name onetrip/backend_app onetrip/backend_app"
            }
        }
        stage('Archiving') { 
            steps {
                echo "Archiving artifacts"
                archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
