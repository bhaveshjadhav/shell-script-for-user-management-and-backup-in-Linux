#!/bin/bash

read -p "Enter the directory to backup: " source_dir
read -p "Enter the backup destination directory: " dest_dir
read -p "Enter the name for the backup folder: " backup_name

# Validate if destination directory exists
if [ ! -d "$dest_dir" ]; then
    echo "Error: Destination directory '$dest_dir' does not exist."
    exit 1
fi

# Create full path for backup directory
backup_dir="$dest_dir/$backup_name"

# Validate if backup directory already exists
if [ -d "$backup_dir" ]; then
    echo "Error: Backup directory '$backup_dir' already exists."
    exit 1
fi

# Create the backup directory
mkdir -p "$backup_dir"

# Perform backup
tar -czvf "$backup_dir/backup_$(date +%y%m%d_%H%M%S).tar.gz" "$source_dir"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed: $backup_dir/backup_$(date +%y%m%d_%H%M%S).tar.gz"
else
    echo "Backup failed. Check your input paths and permissions."
fi

