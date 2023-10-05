#!/bin/bash

# Get the directory where the script is located
script_dir="$(dirname "$0")"

# Change to the script's directory
cd "$script_dir"

# Loop 10 times to create 10 text files
for i in {1..10}; do
    touch "file$i.txt"
    echo "This is file $i" > "file$i.txt"
done

echo "Created 10 text files with .txt extension in the script's directory."
