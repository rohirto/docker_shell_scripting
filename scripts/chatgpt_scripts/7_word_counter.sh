#!/bin/bash

# Check if a file path is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Use 'wc' to count words in the file
word_count=$(wc -w < "$file")

echo "Number of words in '$file': $word_count"
