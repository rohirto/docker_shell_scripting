#!/bin/bash

# Threshold for CPU usage (percentage)
threshold=80

# Function to check CPU usage
check_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
    if [ "$cpu_usage" -gt "$threshold" ]; then
        echo "High CPU usage detected! CPU Usage: $cpu_usage%"
        # You can add alert mechanisms here (e.g., send an email or log to a file)
    else
        echo "CPU Usage is normal: $cpu_usage%"
    fi
}

# Main loop to continuously monitor CPU usage
while true; do
    check_cpu_usage
    sleep 5  # Adjust the interval as needed
done
