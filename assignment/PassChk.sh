#!/bin/bash 

# PassChk.sh - This script propmts the user for a password that is required to run the main script.  
# Author: Andrew Abel
# Date: 21/August/2021

# Script Purpose: Prompt the user for a password, hash it, read in a stored has from a file and compare the two. 
# Echo message based on results of comparison.

# Purpose: Prompt the user for a password, save it to a variable.
echo ""
read -sp 'Please enter the password you wish to use : ' user_submitted_password
echo ""

# Purpose: Hash the value in the variable.
user_submitted_hash=$(echo $user_submitted_password | sha256sum)

# Purpose: Read hash from file.
file_input="AssPass.txt"

# Purpose: While Loop - Read each line of the file and save data to a variable.
while IFS= read -r line
do 
  hashed_input_from_file=$line
done < "$file_input"

# Purpose: If statement to compare the two hash values. If the hashes match, run the a_abel_Admin.sh script.
if [ "$user_submitted_hash" == "$hashed_input_from_file" ] ; then
    echo ""
    echo "Access Granted. The main script will now run."
    ( exec "./Launcher.sh" )
    exit 0
else
    echo ""
    echo "Access Denied. Goodbye."
    exit 1
fi
