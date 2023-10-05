#!/bin/bash

# Check if a log file path and keyword are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <log_file> <keyword>"
    exit 1
fi

log_file="$1"
keyword="$2"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' does not exist."
    exit 1
fi

# Use 'grep' to count occurrences of the keyword in the log file
error_count=$(grep -o -i "$keyword" "$log_file" | wc -l)

echo "Occurrences of '$keyword' in '$log_file': $error_count"
