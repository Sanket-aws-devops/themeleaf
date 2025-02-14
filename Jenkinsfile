pipeline {
    agent any

    tools {
        maven 'MAVEN' // Specify the Maven installation name configured in Jenkins
        jdk 'JDK17'   // Specify the JDK installation name configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from SCM
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dir('thymeleafExample') { // Change this to the subdirectory containing pom.xml
                    sh 'mvn -B -DskipTests clean package'
                }
            }
        }

        stage('Test') {
            steps {
                dir('thymeleafExample') { // Change this as needed
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Deliver') {
            steps {
                echo 'Delivering artifacts...'
            }
        }
    }
}
