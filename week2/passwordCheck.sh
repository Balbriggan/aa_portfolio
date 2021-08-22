#!/bin/bash 

# setPassword.sh - A basic script to take user input, create a folder and store a Password in bash.  
# Author: Andrew Abel
# Date: 28/July/2021

# Script Purpose: Prompt the user for a password, hash it, read in a stored has from a file and compare the two. 
# Echo message based on results of comparison.

# Purpose: Prompt the user for a password, save it to a variable.
read -sp 'Please enter the password you wish to use : ' user_submitted_password

# Purpose: Hash the value in the variable.
user_submitted_hash=$(echo $user_submitted_password | sha256sum)

# Purpose: Read hash from file. PW = 12345
file_input="secret2.txt"

# Purpose: While Loop - Read each line of the file and save data to a variable.
while IFS= read -r line
do 
  hashed_input_from_file=$line
done < "$file_input"

# Purpose: If statement to compare the two hash values.
if [ "$user_submitted_hash" == "$hashed_input_from_file" ] ; then
    echo ""
    echo "Access Granted"
    exit 0
else
    echo ""
    echo "Access Denied"
    exit 1
fi
