#!/bin/bash
# Launcher.sh - Launch script for the Assignment two main script for unit CYB6004.
# Author: Andrew Abel
# Date: 18/August/2021

echo ""

# Purpose: Present the user with two options, run the assignment script or exit. Provide some feedback to the user and prompt for the user to enter 1 or 2.
options=("Run Assignment Script" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Run Assignment Script")
            echo ""
            echo "The Assignment script will now execute. Please stand by!"
            echo ""
            ( exec "./WebScrape.sh" )
            echo ""
            echo "The Assignment script has now been completed!"
            echo ""
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "That's an invalid option. Please try again. $REPLY";;
    esac
done

# Purpose: Use chmod to make the file read only.
echo "The script has created the alerts.csv file."

#curl -s -L -I https://www.cyber.gov.au/acsc/view-all-content/publications | gawk -v IGNORECASE=1 '/^Content-Length/ { print $2 }' 
echo ""
echo "To improve security, the file permissions will now be set to read only."
find . -type f -name "alerts.csv" -exec chmod 0640 {} \;
echo ""
echo "Thank you. The file permissions have now been changed! This completes the program."
echo ""

exit 0