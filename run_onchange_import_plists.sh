#!/bin/bash

PLISTS_DIR="$HOME/.local/share/chezmoi/.plists"

# List of processes to restart
PROCESSES_TO_RESTART=(
    "Rectangle"
    # Add more process names here, e.g.:
    # "AnotherApp"
    # "SomeApp"
)

# Ensure the directory exists
if [ ! -d "$PLISTS_DIR" ]; then
    echo "Error: Directory $PLISTS_DIR does not exist."
    exit 1
fi

# Import all .plist files in the directory
for PLIST_FILE in "$PLISTS_DIR"/*.plist; do
    # Check if the file exists to handle empty directories
    if [ ! -f "$PLIST_FILE" ]; then
        echo "No plist files found in $PLISTS_DIR."
        exit 0
    fi

    DOMAIN=$(basename "$PLIST_FILE" .plist)

    echo "Importing $DOMAIN preferences from $PLIST_FILE..."
    defaults import "$DOMAIN" "$PLIST_FILE"
done

# Restart all specified processes
for PROCESS_NAME in "${PROCESSES_TO_RESTART[@]}"; do
    echo "Restarting $PROCESS_NAME..."
    pkill "$PROCESS_NAME" 2>/dev/null || echo "Process $PROCESS_NAME not running."
    open -a "$PROCESS_NAME" 2>/dev/null || echo "Failed to restart $PROCESS_NAME. App may not be installed."
done

echo "All plist files have been successfully imported and processes restarted."
