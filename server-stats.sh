#!/bin/bash

# Fetching CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}')

# Fetching Memory Usage
memory_usage=$(free -h | grep Mem | awk '{print $3 " used, " $4 " free, " $2 " total, " $3/$2*100 "% used"}')

# Fetching Disk Usage
disk_usage=$(df -h | grep '^/dev/' | awk '{print $3 " used, " $4 " free, " $5 " used"}')

# Fetching OS Version
os_version=$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d= -f2 | sed 's/"//g')

# Fetching Uptime
uptime=$(uptime -p)

# Fetching Load Average (1, 5, 15 minute averages)
load_average=$(uptime | awk -F'load average:' '{ print $2 }')

# Fetching Logged-In Users
logged_in_users=$(who | wc -l)

# Fetching Failed Login Attempts (from /var/log/auth.log or equivalent)
failed_logins=$(grep "Failed password" /var/log/auth.log | wc -l)

# Fetching Top 5 Processes by CPU Usage
top_processes=$(ps aux --sort=-%cpu | head -n 6)

# Output all gathered stats
echo "---- Server Performance Stats ----"
echo "CPU Usage: $cpu_usage"
echo "Memory Usage: $memory_usage"
echo "Disk Usage: $disk_usage"
echo "OS Version: $os_version"
echo "Uptime: $uptime"
echo "Load Average: $load_average"
echo "Logged-In Users: $logged_in_users"
echo "Failed Login Attempts: $failed_logins"
echo "---- Top 5 Processes by CPU Usage ----"
echo "$top_processes"
