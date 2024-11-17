#!/bin/bash

# CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Memory usage
memory_info=$(free -h | grep Mem)
used_mem=$(echo $memory_info | awk '{print $3}')
free_mem=$(echo $memory_info | awk '{print $4}')
total_mem=$(echo $memory_info | awk '{print $2}')
memory_percentage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Disk usage
disk_usage=$(df -h / | grep / | awk '{print $3 " used, " $4 " free, " $5 " used"}')

# Top 5 processes by CPU usage
top_processes=$(ps aux --sort=-%cpu | head -n 6)

# Display stats
echo "---- Server Performance Stats ----"
echo ""
echo "CPU Usage: $cpu_usage%"
echo ""
echo "Memory Usage: $used_mem used, $free_mem free, $total_mem total, $memory_percentage% used"
echo ""
echo "Disk Usage: $disk_usage"
echo ""
echo "Top 5 Processes by CPU Usage:"
echo "$top_processes"

