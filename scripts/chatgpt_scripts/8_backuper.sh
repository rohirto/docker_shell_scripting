#!/bin/bash

# Source directory to be backed up
source_dir="/workspaces/docker_shell_scripting/scripts/test/src_folder"

# Backup destination directory (with timestamp)
backup_dir="/workspaces/docker_shell_scripting/scripts/test/dest_folder/backup_$(date +'%Y%m%d_%H%M%S')"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory '$source_dir' does not exist."
    exit 1
fi

# Create the backup destination directory
mkdir -p "$backup_dir"

# Copy files and directories from source to backup
cp -r "$source_dir"/* "$backup_dir"

echo "Backup completed. Files copied to '$backup_dir'."
