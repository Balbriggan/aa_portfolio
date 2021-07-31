#!/bin/bash 

# menu.sh - A basic script that includes an if and case statements.  
# Author: Andrew Abel
# Date: 31/July/2021

# Script Purpose: Call a different script, evaluate its exit value and either terminate with a message or present further options to call subsequent scripts.

# Purpose: Call the preliminary script passwordCheck and capture its return code.
( exec "./passwordCheck.sh" )

ret_code=$?

# Purpose: IF statement to display a message and terminate if the return code = 1 - password didn't match.
if [ "$ret_code" == "1" ] ; then
    echo "Goodbye"
    exit 0
fi

# Purpose: Case Statement based on the return code = 0. This presents 3 options and calls a new script to carry out the use choice.
PS3='Please enter your choice: '
options=("Create a Folder" "Copy a Folder" "Set a Password" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create a Folder")
            echo ""
            echo "You chose to Create a Folder"
            echo ""
            ( exec "./foldermaker.sh" )
            echo ""
            echo "Your Folder has been Created"
            echo ""
            break
            ;;
        "Copy a Folder")
            echo ""
            echo "You chose to Copy a Folder"
            echo ""
            ( exec "./foldercopier.sh" )
            echo ""
            echo "Your Folder has been Copied"
            echo ""
            break
            ;;
        "Set a Password")
            echo "You chose to Set a Password"
            echo ""
            ( exec "./setPassword.sh" )
            echo ""
            echo "The Password has been Set"
            echo ""
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

exit 0