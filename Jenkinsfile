pipeline {
    agent any
     tools {
            maven 'MAVEN_HOME' 
            }
    /* environment{
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
    JFROG_PASSWORD = credentials('jfrog-password')
    }  */
       stages {
       /* stage('SonarAnalysis') {
            steps {
                
                bat 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_742de708e132baee11e097febf45cfb0b4789205 -Dsonar.projectKey=Bench_Practice'
            }
        }     */
       stage('Build') {
        steps {
                 bat 'mvn install'
            }
        }
       stage('upload artifacts') {
        steps {
                 bat 'curl -sSf -u "admin:password" -X PUT -T target/TestCalculatorAppJuly21Batch.war "http://localhost:8082/artifactory/example-repo-local/TestCalculatorAppJuly21Batch.war"'
            }
        }
           
     /*  stage('Artifactory Server') {
        steps {
         rtServer (
          id: 'JFROG',
          url: 'http://localhost:8081/artifactory',
          username: 'admin',
          password: 'password',
          timeout: 300)
        }
       }
     stage('Downloading Artifacts'){
    steps{
        rtDownload(
            serverId: 'JFROG',
            spec: '''{
            "files": [
            {
             "pattern": "example-repo-local",
             "target": ""
               }
              ]
               }''',
               )
            }
           }     
       stage('Uploading Artifacts') {
           steps {
               script {
    def server = Artifactory.server 'JFROG'
    def uploadSpec = '''{
        "files": [{
        "pattern": "example-repo-local",
        "target": "example-repo-local/bench-practice"
        }]
    }'''
    server.upload(uploadSpec) 
}
                   }
               }

           
         stage('DockerImageBuild') {
            steps {
                bat 'docker build -t testimage .'
                bat 'docker run -d -p 8089:8080 testimage'
            }
        }    */
    }
}
