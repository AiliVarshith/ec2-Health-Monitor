pipeline {
    agent any 
    stages {
        stage('Run Monitor') {
            steps {
                echo '🚀 Starting the health monitor script...'
                sh 'chmod +x monitor.sh'
                sh './monitor.sh'
            }
        }
    }
}
