pipeline {
    agent any 
    stages {
        stage('Fetch Code') {
            steps {
                // Quotes are required for the URL and branch name
                git branch: 'main', url: 'https://github.com/AiliVarshith/ec2-Health-Monitor.git'
            }
        }
        stage('Build') {
            steps {
                // You don't strictly need the 'script' block for basic shell commands
                sh 'chmod +x monitor.sh'
                sh './monitor.sh'
            }
        }
    }
}
