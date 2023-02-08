pipeline {
    agent any 
    stages {
        stage('Compile and Clean') { 
            steps {
                sh "mvn clean compile"
            }
        }
        stage('deploy') { 
            
            steps {
                sh "mvn package -DskipTests"
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Hello"
                sh 'ls'
                sh 'docker build -t onetrip/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Kill running Spring Boot instance'){
            steps {
                sh 'docker ps | grep "onetrip/docker_jenkins_springboot" | awk "{print $1}" | xargs docker stop'
            }
        }
        stage('Docker deploy'){
            steps {    
                sh "docker run -itd -p 9000:9000 onetrip/docker_jenkins_springboot:${BUILD_NUMBER}"
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
