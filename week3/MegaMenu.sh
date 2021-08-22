#!/bin/bash 

# MegaMenu.sh - A basic script that includes an if and case statements.  
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

# Purpose: Case Statement based on the return code = 0. This presents 8 options and calls a new script to carry out the use choice. 
# The script loops until exit option 8 is chosen.
# Alternating colours alre also used for clarity betwen choices.

txtblu=$(tput setaf 4)
PS3="${txtblu} Please enter your choice to continue using the program : "
options=("Create a Folder" "Copy a Folder" "Set a Password" "Use Calculator" "Create Week Folders" "Check Filename" "Download a File" "Exit")
txtrst=$(tput sgr0)
select opt in "${options[@]}"
do
    case $opt in
        "Create a Folder")
            echo ""
            echo "${txtrst}You chose to Create a Folder"
            echo ""
            ( exec "./foldermaker.sh" )
            echo ""
            echo "Your Folder has been Created. MegaMenu will now resume."
            echo ""
            ;;
        "Copy a Folder")
            echo ""
            echo "${txtrst}You chose to Copy a Folder"
            echo ""
            ( exec "./foldercopier.sh" )
            echo ""
            echo "Your Folder has been Copied. MegaMenu will now resume."
            echo ""            
            ;;
        "Set a Password")
            echo ""
            echo "${txtrst}You chose to Set a Password"
            echo ""
            ( exec "./setPassword.sh" )
            echo ""
            echo "The Password has been Set. MegaMenu will now resume."
            echo ""            
            ;;
        "Use Calculator")
            echo ""
            echo "${txtrst}You chose to use the Calculator"
            echo ""
            ( exec "./calculator.sh" )
            echo ""
            echo "Thank you for using Calculator. MegaMenu will now resume."
            echo ""            
            ;;
        "Create Week Folders")
            echo ""
            echo "${txtrst}You chose to create additional folders"
            echo ""
            ( exec "./foldercopier.sh" )
            echo ""
            echo "The folders have been created. MegaMenu will now resume."
            echo ""            
            ;;
        "Check Filename")
            echo ""
            echo "${txtrst}You chose to check a Filename"
            echo ""
            ( exec "./filenames.sh" )
            echo ""
            echo "The filename has been checked. MegaMenu will now resume."
            echo ""            
            ;;
        "Download a File")
            echo ""
            echo "${txtrst}You chose to download a file"
            echo ""
            ( exec "./InternetDownloader.sh" )
            echo ""
            echo "The file has been downloaded. MegaMenu will now resume."
            echo ""            
            ;;                
        "Exit")
            echo ""
            txtred=$(tput setaf 1)
            echo "${txtred}You have chosen to exit the program. Shutting down main engines."
            echo ""
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

exit 0