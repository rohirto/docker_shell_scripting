#!/bin/bash

# Define the IP range to scan (adjust as needed)
start_ip="192.168.1.1"
end_ip="192.168.1.254"

# Function to check if a host is online
check_host() {
    host_ip="$1"
    if ping -c 1 "$host_ip" >/dev/null 2>&1; then
        echo "Host $host_ip is online."
        # You can add additional code here to check for open ports/services
    fi
}

# Loop through the IP range and check each host
ip_parts_start=($(echo "$start_ip" | tr '.' ' '))
ip_parts_end=($(echo "$end_ip" | tr '.' ' '))

for ((a=${ip_parts_start[0]}; a<=${ip_parts_end[0]}; a++)); do
    for ((b=${ip_parts_start[1]}; b<=${ip_parts_end[1]}; b++)); do
        for ((c=${ip_parts_start[2]}; c<=${ip_parts_end[2]}; c++)); do
            for ((d=${ip_parts_start[3]}; d<=${ip_parts_end[3]}; d++)); do
                ip_to_scan="$a.$b.$c.$d"
                check_host "$ip_to_scan" &
            done
        done
    done
done

# Wait for all background processes to finish
wait
