pipleline{
        agent any{
            stages{
                stage('Fetch Code'){
                    steps{
                        script
                        {
                            sh 'git clone <https://github.com/AiliVarshith/ec2-Health-Monitor.git>'
                            sh 'chmod + monitor.sh'
                            sh './monitor.sh'
                        }
                    }
                }
            }
        }
}
