
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

# grep -E -> since i am using WSL ,to filter the lines starting with spaces and then find for the digit b/w 0-9



echo "Health Monitor starting...."

echo "=== CPU utilization ===" 

total_cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $4}')

echo "Total CPU Usage: $total_cpu%"

top_cpu_process=$(top -bn1 | grep -E "^[[:space:]]*[0-9]" | sort -rn -k 9 | head -1)   

echo "=== TOP CPU PROCESS ==="

cpu_percent=$(echo "$top_cpu_process" | awk '{print $9}')

process_name=$(echo "$top_cpu_process" | awk '{print $12}')

echo "Process : $process_name | CPU : $cpu_percent%"

echo "=== Disk Usage ==="

disk_usage1=$(df -h --total | tail -1)

total_disk_space=$(echo "$disk_usage1" | awk '{print $2}')

available_disk_space=$(echo "$disk_usage1" | awk '{print $4}')

echo "Total_Disk_Space : $total_disk_space | Available_Disk_Space : $available_disk_space "

echo "=== Memory Usage ==="

memory_usage=$(free -h | grep "Mem:")

total_memory=$(echo "$memory_usage" | awk '{print $2}')
used_memory=$(echo "$memory_usage" | awk '{print $3}')
available_memory=$(echo "$memory_usage" | awk '{print $7}')

echo "Total_Memory : $total_memory | Used_Memory : $used_memory | Available_Memory : $available_memory"

echo "Health Monitor completed successfully"





	




 

