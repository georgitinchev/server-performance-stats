#!/bin/bash

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Get Memory usage
memory_usage=$(free -h | grep Mem)
used_mem=$(echo $memory_usage | awk '{print $3}')
free_mem=$(echo $memory_usage | awk '{print $4}')
total_mem=$(echo $memory_usage | awk '{print $2}')
mem_percentage=$(echo "scale=2; 100 - ($free_mem / $total_mem) * 100" | bc)

# Get Disk usage
disk_usage=$(df -h / | awk 'NR==2 {print $3 " used, " $4 " free, " $5 " used"}')

# Get Top 5 Processes by CPU usage
top_cpu_processes=$(ps aux --sort=-%cpu | head -n 6)

# Get Top 5 Processes by Memory usage
top_mem_processes=$(ps aux --sort=-%mem | head -n 6)

# Display the stats with formatting
echo -e "\n---- Server Performance Stats ----"
echo -e "\nCPU Usage: $cpu_usage%"
echo -e "\nMemory Usage: $used_mem used, $free_mem free, $total_mem total, $mem_percentage% used"
echo -e "\nDisk Usage: $disk_usage"

echo -e "\nTop 5 Processes by CPU Usage:"
echo -e "$top_cpu_processes"

echo -e "\nTop 5 Processes by Memory Usage:"
echo -e "$top_mem_processes"

echo -e "\n------------------------------------"
