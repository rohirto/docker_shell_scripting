#!/bin/bash

# check if user has provided args or not
if [ $# -eq 0 ]
then
    echo "No arguments provided"
    echo "Please provide some arguments"
    exit 1
fi
# initialize sum to zero
sum=0

# Loop through all args and icrement the sum
for arg in "$@"
do
    sum=$((sum+arg))
done

#display the result
echo "Result is: $sum"