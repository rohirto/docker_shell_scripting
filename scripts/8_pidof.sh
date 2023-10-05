#!/bin/bash

# Script will take name as a parameter and returns the PID of processes with that name

# check if user has provided any input or not
if [ "$#" -eq 0 ] 
then
    echo "No user input provided"
    exit 1
fi

#get the process name 
process_name="$1"

# Use pgrep to find the PID(s) of processes with the given name
pids=$(pgrep "$process_name")

# Check if any PIDs were found
if [ -z "$pids" ] # if pids len is zero 
then
    echo "No processes found with the name '$process_name'."
else # pid len is non zero
    echo "PID(s) of processes with the name '$process_name':"
    for pid in $pids
    do
    # Command to get the process name, just the process name
        process_name=$(ps -p "$pid" -o comm=)
        echo "PID: $pid, Process Name: $process_name"
    done
fi