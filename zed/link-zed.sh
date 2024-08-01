#!/bin/bash

# Define paths
ZED_CONFIG="$HOME/.var/app/dev.zed.Zed/config/zed"
LINUX_UTILS_CONFIG="$HOME/linux-utils/zed/config"

# Check if the target directory exists
if [ ! -d "$LINUX_UTILS_CONFIG" ]; then
    echo "Error: $LINUX_UTILS_CONFIG does not exist."
    exit 1
fi

# Remove existing Zed config directory if it exists
if [ -d "$ZED_CONFIG" ]; then
    echo "Removing existing Zed config directory..."
    rm -rf "$ZED_CONFIG"
fi

# Create symlink
echo "Creating symlink..."
ln -s "$LINUX_UTILS_CONFIG" "$ZED_CONFIG"

# Verify symlink creation
if [ -L "$ZED_CONFIG" ] && [ "$(readlink -f "$ZED_CONFIG")" = "$LINUX_UTILS_CONFIG" ]; then
    echo "Symlink created successfully."
else
    echo "Error: Failed to create symlink."
    exit 1
fi
