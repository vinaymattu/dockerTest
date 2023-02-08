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
                sh 'docker build -t backendapp .'
            }
        }
        stage('Docker deploy'){
            steps {
                sh "docker stop backendapp || true"
                sh "docker rm backendapp || true"
                sh "docker run -itd -p 9000:9000 --name backendapp backendapp"
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
