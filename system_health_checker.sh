#!/bin/bash

echo "System Health Report"
echo "---------------------"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
echo "CPU Usage: ${cpu_usage}%"

memory_usage=$(free | awk '/Mem/{print $3/$2 * 100.0}')
echo "Memory Usage: ${memory_usage}%"

disk_space=$(df -h | awk '/\/$/ {print $5}')
echo "Disk Space: ${disk_space}"

ping_result=$(ping -c 4 google.com | grep "packet loss" | awk '{print $6}')
echo "Network Connectivity: ${ping_result}"

process_count=$(ps aux | wc -l)
echo "Running Processes: ${process_count}"

error_logs=$(grep -i error /var/log/syslog)
echo "System Errors: ${error_logs}"

echo "---------------------"
