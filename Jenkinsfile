pipeline {

    agent {

            label 'java-docker-slave'
    }
//change

    stages {

        stage('Code Checkout') {
            steps {
                checkout([
$class: 'GitSCM',
branches: [[name: '*/master']],
userRemoteConfigs: [[url: 'https://narendrakumar02-admin@bitbucket.org/narendrakumar02-admin/bitbucket_cloud_agent.git']]
            }
        }

        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                bat """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }

        stage(' Unit Testing') {
            steps {
                bat """
                echo "Running Unit Tests"
                """
            }
        }

        stage('Code Analysis') {
            steps {
                bat """
                echo "Running Code Analysis"
                """
            }
        }

        stage('Build Deploy Code') {
            when {
                branch 'develop'
            }
            steps {
                bat """
                echo "Building Artifact"
                """

                bat """
                echo "Deploying Code"
                """
            }
        }

    }
}
