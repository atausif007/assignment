pipeline {
    agent any 
    stages {
        stage('Clone App code ') { 
            steps {
                sh 'rm -rf assignment'
                sh 'git clone https://github.com/atausif007/assignment.git'
            }
        }
    
        stage('Create app image dockerfile') { 
            steps {
                sh 'cp /var/lib/jenkins/workspace/app/assignment/* /var/lib/jenkins/workspace/app/'
                sh 'docker build . -f Dockerfile -t helloworld'

            }
        }
    
        stage('Push docker image in ECR') { 
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 539946502700.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker tag helloworld 539946502700.dkr.ecr.us-east-1.amazonaws.com/app:v1'
                sh 'docker push 539946502700.dkr.ecr.us-east-1.amazonaws.com/app:v1'
            }
        }
     }
    
}
