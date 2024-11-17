#!/bin/bash

# DIsplay Total CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*; *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

# Display Total Memory Usage
echo "Memory Usage:"
free -h | grep Mem | awk '{print "Used: " $3 ", Free: " $4 ", Total: " $2 ", Percentage: " $3/$2*100 "%"}'

# Display Total Disk Usage
echo "Disk Usage:"
df -h | grep -E '^/dev/'

# Display Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -n 6

# Display Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -n 6


