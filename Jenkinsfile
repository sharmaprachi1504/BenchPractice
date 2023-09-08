pipeline {
    agent any
     tools {
            maven 'MAVEN_HOME' 
            }
       stages {
        stage('Build') {
            steps {
               
                bat 'mvn install'
            }
        }
        stage('SonarAnalysis') {
            steps {
                
                bat 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_742de708e132baee11e097febf45cfb0b4789205 -Dsonar.projectKey=Bench_Practice'
            }
        }
        stage('DockerImageBuild') {
            steps {
                bat 'docker build -t testimage .'
                bat 'docker run -d -p 8089:8080 testimage'
            }
        }
    }
}
