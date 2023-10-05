#!/bin/bash
directory="/workspaces/docker_shell_scripting/scripts/test"
file="file1.txt"

if [ -e "$directory/$file" ]; then
    echo "$file exists in $directory."
else
    echo "$file does not exist in $directory."
fi