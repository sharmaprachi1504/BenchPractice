pipeline {
    agent any
    
    
      tools {
            maven 'MAVEN_HOME'
             terraform 'Terraform'
             }
   stages {
       /*  stage('SonarAnalysis') {
             steps {
                
                 bat 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_742de708e132baee11e097febf45cfb0b4789205 -Dsonar.projectKey=Bench_Practice'
                 
             }
         }  */   
     stage('Build') {
        steps {
                  
                   bat'mvn install'
            }
        }
     /*  stage('Upload Artifacts') {
        steps {
                 bat 'curl -sSf -u "admin:password" -X PUT -T target/TestCalculatorAppJuly21Batch.war "http://localhost:8082/artifactory/example-repo-local/TestCalculatorAppJuly21Batch.war"'
            }
        }  */ 
   /*     stage('Creating Infra on AWS') {
            steps {
            script{
                withCredentials([[
                 $class: 'AmazonWebServicesCredentialsBinding',
                 credentialsId: "aws-terraform",
                 accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                 secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]){
             if(env.InfraProvisioning == 'true'){
                bat '''
                cd Bench_Training
                terraform fmt
                terraform init 
                terraform plan
                terraform validate
                terraform apply --auto-approve
                '''
             }
             }
             }
           }    
        } */
       stage('Deploy App on Infra') {
            steps {
            script{       
           if(env.AppDeploy == 'true'){
              bat '''
                scp -v -o StrictHostKeyChecking=no -i training_test.pem target/TestCalculatorAppJuly21Batch.war ubuntu@%IP_Address%:/tmp              
                ssh -i  training_test.pem ubuntu@%IP_Address% 
                
              
                goto comment..
                icacls mynewkey.pem /inheritance:r /remove "BUILTIN\\Users" /grant "admin:R"          
                scp -v -r -o StrictHostKeyChecking=no -i mynewkey.pem target/TestCalculatorAppJuly21Batch.war ubuntu@%IP_Address%:/tmp
                sftp -i mynewkey.pem ubuntu@3.89.150.52               
                sudo apt-get update
                sudo apt-cache search tomcat
                sudo apt install tomcat9 tomcat9-admin -y
                ss -ltn
                sudo systemctl enable tomcat9
                sudo mv /tmp/TestCalculatorAppJuly21Batch.war  /var/lib/tomcat9/webapps/
                sudo systemctl restart tomcat9    
                :comment..
                '''
           }
             }
           }
         }
       
       }  
    }
