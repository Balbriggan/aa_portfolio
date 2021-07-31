#!/bin/bash 

# setPassword.sh - A basic script to take user input, create a folder and store a Password in bash.  
# Author: Andrew Abel
# Date: 21/July/2021

# Purpose: Prompt the user for the name of the new directory.
      
read -p "Type the name of the folder you would like to create : " folderName 

# Purpose: Create a new directory with the name provided by the user.
      
mkdir "$folderName" 

# Purpose: Advise the user that the folder has been created

echo "A directory called $folderName has now been created"

# Purpose: Prompt the user for a password

read -sp 'Please enter the password you wish to use : ' pass_var

# Purpose: Create a file that contains the hash of the password in the new folder

echo $pass_var | sha256sum > $folderName/secret2.txt

# Purpose: echo to skip a line & improve visual look

echo 

# Purpose: Display the use of exit. A successful exxcution returns 0.

exit 0
     