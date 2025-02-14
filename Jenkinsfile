pipeline {
    agent any

    tools {
        maven 'MAVEN' // Specify the Maven installation name configured in Jenkins
        jdk 'JAVA'   // Specify the JDK installation name configured in Jenkins
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
                dir('thymeleafExample') { // Navigate to the directory containing pom.xml
                    sh 'mvn -B -DskipTests clean package'
                }
            }
        }

        stage('Test') {
            steps {
                dir('thymeleafExample') { // Navigate to the directory containing pom.xml
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'thymeleafExample/target/surefire-reports/*.xml' // Adjust path if necessary
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
