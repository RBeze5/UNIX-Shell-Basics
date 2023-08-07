#!/bin/bash

# Check if the script is executed with proper arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Store the provided directory path in a variable
directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Navigate to the specified directory
cd "$directory"

# Create a new file
touch myfile.txt

# Print a message to the file
echo "Hello, this is my file!" > myfile.txt

# Display the contents of the file
cat myfile.txt

# Count the number of words in the file
word_count=$(wc -w < myfile.txt)
echo "Word count: $word_count"

# Search for a specific word in the file
search_word="file"
grep -q "$search_word" myfile.txt
if [ $? -eq 0 ]; then
    echo "The word '$search_word' exists in the file."
else
    echo "The word '$search_word' does not exist in the file."
fi

# Rename the file
new_filename="new_file.txt"
mv myfile.txt "$new_filename"
echo "File renamed to '$new_filename'."

# Display the current date and time
current_datetime=$(date)
echo "Current date and time: $current_datetime"

# Remove the file
rm "$new_filename"
echo "File '$new_filename' removed."

# Print the contents of the current directory
echo "Contents of the directory:"
ls

# Display the total number of files in the directory
file_count=$(ls | wc -l)
echo "Total files in the directory: $file_count"

# Change permissions of the current directory
chmod 700 .

# Display the updated permissions
current_permissions=$(stat -c "%a %n" .)
echo "Updated permissions: $current_permissions"
