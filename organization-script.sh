#!/bin/bash

# Get the path to the current folder
main_folder="$(pwd)"

# Create the organized_folder path
organized_folder="$main_folder/organized"
mkdir -p "$organized_folder"

# Move files to subfolders based on basename
for file in "$main_folder"/*; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        basename="${filename%.*}"

        # Create a subfolder for each basename within the organized_folder
        subfolder="$organized_folder/$basename"
        mkdir -p "$subfolder"

        # Move all files with the same basename to the subfolder
        mv "$main_folder/$basename"* "$subfolder/"
    fi
done

# Move the organized folders back to the main folder
mv "$organized_folder"/* "$main_folder/"
rm -r "$organized_folder"

echo "Files organized successfully!"

