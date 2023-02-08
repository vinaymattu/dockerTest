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
                echo "Hello"
                sh 'ls'
                sh 'docker build -t onetrip/backend_app .'
            }
        }
        stage('Docker deploy'){
            steps {    
                sh "docker stop onetrip/backend_app"
                sh "docker rm onetrip/backend_app"
                sh "docker run -itd -p 9000:9000 --name onetrip/backend_app onetrip/backend_app"
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
