pipeline {
    agent any

    tools {
        maven 'MAVEN'
        jdk 'JAVA'
    }

    environment {
        S3_BUCKET = 'jenkins-test-sanket' // Replace with your bucket name
        ARTIFACT_PATH = 'thymeleafExample/target/*.jar' // Adjust if your artifact is .war or has a different name
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dir('thymeleafExample') {
                    sh 'mvn -B -DskipTests clean install'
                }
            }
        }

        stage('Test') {
            steps {
                dir('thymeleafExample') {
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'thymeleafExample/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Deliver') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'jenkins-aws-credentials'
                ]]) {
                    sh """
                        aws s3 cp ${ARTIFACT_PATH} s3://${S3_BUCKET}/ --region ${AWS_DEFAULT_REGION}
                    """
                }
            }
        }
    }
}
