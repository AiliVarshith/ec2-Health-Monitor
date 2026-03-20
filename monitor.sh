
#!/bin/bash

#Created on 20/03/2026 in the morning

#Author : Aili Varshith 

#Note: This is my first basic project in learning DevOps and many more to go.

#Updated : Added CPU,RAM,Newtwork,Disk Usage monitoring and process restart feature.

 
set -e

echo "Health Monitor starting...."

# Overall CPU utilization

# Get top CPU-consuming process

#  process name (usually 12th field) and cpu %( 9th field ).

# using -bn1 in top  because it gives a snapshot of top and exits the top , as we generally dont use top command while writing scripts , we use in live monitoring .

# r - reverse order (descending ) ,n - numerical sort (not alphabeical) ,-k 9 sort by column 9 (the %cpu field).

# while using a variable (cpu_percent=$..) -> correct syntax , (cpu_percent = $ ..) -> wrong syntax

# grep -E -> since i am using WSL ,to filter the lines starting with spaces and then find for the digit b/w 0-9.

top -bn1 | grep "Cpu(s)" | awk '{print $2}'

top_cpu_process=$(top -bn1 | grep -E "^[[:space:]]*[0-9]" | sort -rn -k 9 | head -1)   

echo "=== TOP CPU PROCESS ==="

echo "$top_cpu_process"

cpu_percent=$(echo "$top_cpu_process" | awk '{print $9}')

process_name=$(echo "$top_cpu_process" | awk '{print $12}')

echo "Process : $process_name | CPU : $cpu_percent%"




 

