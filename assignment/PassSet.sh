#!/bin/bash 

# PassSet.sh - This script prompts the user for a password that will be hashed and stored for use to launch the main script  
# Author: Andrew Abel
# Date: 21/August/2021

# Purpose: Prompt the user for a password
echo ""
read -sp 'Please enter the password you wish to use : ' pass_var
echo ""
echo ""
echo "Thank you. The password you have entered has been stored and can be used to launch the main script."
echo ""

# Purpose: Create a file that contains the hash of the password.

echo $pass_var | sha256sum > AssPass.txt


# Purpose: echo to skip a line & improve visual look.

echo ""

# Purpose: Display the use of exit. A successful exxcution returns 0.

exit 0
     