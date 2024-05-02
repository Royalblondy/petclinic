pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/Royalblondy/petclinic.git']]])
            }
        }
        stage("Build docker image"){
            steps{
                sh "docker build -t spring-petclinic -f ./DockerfileBulid.Dockerfile ."
            }
        }
        stage("Test container docker image"){
            steps{
                sh "docker build -t petclinic-test -f ./DockerfileTest.Dockerfile ."
            }
            post {
                always {
                    archiveArtifacts artifacts: 'logs_${env.BUILD_NUMBER}.log', fingerprint: true
                }
            }
        }
    }
}
