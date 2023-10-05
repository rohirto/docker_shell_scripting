#!/bin/bash

directory="test"
#check if our directory exists or not
if [ ! -d "$directory" ]
then
    echo "directory does not exists"
    exit 1
fi

# Rename all .txt files to .text files
for file in "$directory"/*.txt
do
    if [ -e "$file" ]
    then
        newname="${file%.txt}.text"
        mv "$file" "$newname"
        echo "Renamed: $file -> $newname"
    fi
done

echo "Renaming complete"