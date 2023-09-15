pipeline {
    agent any
     tools {
            maven 'MAVEN_HOME'
            //terraform 'Terraform'
            }
       stages {
       //   stage('SonarAnalysis') {
       //      steps {
                
       //          bat 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_742de708e132baee11e097febf45cfb0b4789205 -Dsonar.projectKey=Bench_Practice'
       //      }
       //  }     
     stage('Build') {
        steps {
                 bat 'mvn install'
            }
        }
       stage('Upload Artifacts') {
        steps {
                 bat 'curl -sSf -u "admin:password" -X PUT -T target/TestCalculatorAppJuly21Batch.war "http://localhost:8082/artifactory/example-repo-local/TestCalculatorAppJuly21Batch.war"'
            }
        }   
        stage('DockerImageBuild') {
            steps {
                bat 'docker build -t testimage .'
               // bat 'docker run -d -p 8089:8080 testimage'
            }
        }    

        stage('Creating Infra on AWS') {
            steps {
                bat '''
                cd Bench_Training
                terraform init 
                terraform plan
                terraform validate
                terraform apply --auto-approve
                '''
            }
        }    
    }
}
