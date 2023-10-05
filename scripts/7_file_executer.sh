#!/bin/bash

#give the address of directory where files are
directory="test"

# check if dir exists
if [ ! -d "$directory" ]
then
    echo "$directory does not exist"
    exit 1
fi

# Execute the files through a loop
for file in "$directory"/*
do
    if [ -x "$file" ]
        then 
            echo "Running $file"
            # Measure the execution time using 'time' command and capture it in a variable
            # Back ticks in shell are used as command substitution, can also use $() too instead of backticks
            start=`date +%s` 
            ./"$file"
            end=`date +%s`
            execution_time=$((end - start))
        
            echo "Execution time for $file: $execution_time"
            echo "----------------------------------------"
    fi
done
