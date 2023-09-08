pipeline {
    agent any
     tools {
            maven 'MAVEN_HOME' 
            }
       stages {
        stage('SonarAnalysis') {
            steps {
                
                bat 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_742de708e132baee11e097febf45cfb0b4789205 -Dsonar.projectKey=Bench_Practice'
            }
        }
           stage('Build') {
            steps {
               
                bat 'mvn install'
            }
        }
       stage('Uploading Artifacts') {
           steps {
                script {
                    def server = Artifactory.server 'JFROG'
                    def buildInfo = Artifactory.newBuildInfo()
                    buildInfo.env.capture = true
                    buildInfo.env.collect()
                    def uploadSpec = """{
                    "files": [{
                           "pattern": "**/target/*.jar",
                           "target": "example-repo-local" },
                                 {
                           "pattern": "**/target/*.pom",
                           "target": "example-repo-local"},
                                 {
                            "pattern": "**/target/*.war",
                            "target": "example-repo-local"
                                }]
                              }"""
                   server.upload spec: uploadSpec, buildInfo: buildInfo
                   server.publishBuildInfo buildInfo      
                       }
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
