#!/bin/bash

# Array of folders/files to backup
paths_to_backup=(
    "~/.ssh"
    "~/.kube/config"
    "~/kube"
    # Add more paths as needed
)

# Check if target folder is provided
if [ $# -eq 0 ]; then
    echo "Error: No target folder specified."
    echo "Usage: $0 <target_folder>"
    exit 1
fi

target_folder="$1"

# Create target folder
if ! mkdir -p "$target_folder"; then
    echo "Error: Failed to create target folder '$target_folder'."
    exit 1
fi

# Total number of items to backup
total_items=${#paths_to_backup[@]}
current_item=0

# Function to update progress bar
update_progress() {
    local progress=$((current_item * 100 / total_items))
    local filled=$((progress / 2))
    printf "\033[s"  # Save cursor position
    printf "\033[%d;0H" "$(tput lines)"  # Move cursor to last line
    printf "Progress: [%-50s] %3d%%" "$(printf '#%.0s' $(seq 1 $filled))" "$progress"
    printf "\033[u"  # Restore cursor position
}

# Clear the last line of the terminal
clear_last_line() {
    printf "\033[%d;0H\033[K" "$(tput lines)"
}

# Loop through paths and copy if they exist
for path in "${paths_to_backup[@]}"; do
    ((current_item++))
    expanded_path=$(eval echo "$path")
    clear_last_line  # Clear the last line before new output
    if [ -e "$expanded_path" ]; then
        # Create the directory structure in the target folder
        target_path="$target_folder${expanded_path#$HOME}"
        target_dir=$(dirname "$target_path")
        mkdir -p "$target_dir"
        
        echo "Copying $path to $target_path (${current_item}/${total_items})"
        cp -R "$expanded_path" "$target_path" 2>/dev/null
    else
        echo "Warning: $path does not exist, skipping (${current_item}/${total_items})"
    fi
    update_progress
done

clear_last_line
echo "Backup stored in $target_folder"
