pipeline {
    agent any 
    stages {
        stage('Compile and Clean') { 
            steps {
                // Run Maven on a Unix agent.  
                sh "mvn clean compile"
            }
        }
        stage('deploy') { 
            
            steps {
                sh "mvn package"
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Hello"
                sh 'ls'
                sh 'docker build -t  onetrip/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Docker deploy'){
            steps {
               
                sh 'docker run -itd -p  8081:8080 onetrip/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}

