#!/bin/bash

# Check if a directory path is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Use the 'find' command to count files (excluding directories)
file_count=$(find "$directory" -type f | wc -l)

echo "Number of files in '$directory': $file_count"
