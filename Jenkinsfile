pipeline {
    agent any
    stages {
        stage('Monitor') {
            steps {
                // We pass the 90 threshold directly to the script
                sh '''
                    chmod +x monitor.sh
                    ./monitor.sh
                    
                    # Simple check: Get the number and compare it
                    CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
                    
                    if (( $(echo "$CPU_LOAD > 90" | bc -l) )); then
                        echo "⚠️ CPU is too high: $CPU_LOAD%"
                        exit 1
                    fi
                '''
            }
        }
    }
}
