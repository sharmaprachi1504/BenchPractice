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
                  
                   bat 'mvn install'
            }
        }
     /*  stage('Upload Artifacts') {
        steps {
                 bat 'curl -sSf -u ":cmVmdGtuOjAxOjE3MjY3NTAwMjY6b3NVd1FqMERrdWdtd3pYbmdpTGltSnRLOUdY" -X PUT -T target/TestCalculatorAppJuly21Batch.war "https://awsec2practice.jfrog.io/artifactory/generic-local/TestCalculatorAppJuly21Batch.war"
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
       stage('Tomcat Setup') {
            steps {
            script{       
          if(env.Tomcat == 'true'){
              bat '''
               
                goto comment..         
                sudo apt-get update
                sudo apt-cache search tomcat
                sudo apt install tomcat9 tomcat9-admin -y
                ss -ltn
                sudo systemctl enable tomcat9
                sudo mv /tmp/TestCalculatorAppJuly21Batch.war  /var/lib/tomcat9/webapps/
                sudo systemctl restart tomcat9    
                :comment..
                '''
                 }}}}
                
       def remote = [:]
       remote.name = 'prachi'
       remote.host = '54.164.10.152'
       remote.user = 'prachi'
       remote.password = 'hello1234'
       remote.allowAnyHosts = true
    stage('Deploy App on Infra') {
             if(env.AppDeploy == 'true'){
              sshCommand remote: remote, command: "echo 'hello1234' | sudo -S wget -O /var/lib/tomcat9/webapps/app.war --header='X-JFrog-Art-Api:cmVmdGtuOjAxOjE3MjY3NTAwMjY6b3NVd1FqMERrdWdtd3pYbmdpTGltSnRLOUdY' https://awsec2practice.jfrog.io/artifactory/generic-local/TestCalculatorAppJuly21Batch.war"     
                  }
             }
           }
    }
