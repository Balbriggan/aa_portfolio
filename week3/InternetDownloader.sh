#!/bin/bash

# InternetDownloader.sh - A basic script that uses wget to download a file entered by the user and save it to a folder chosen by the user.
# Author: Andrew Abel
# Date: 1/August/2021

# Script Purpose: Call a different script, evaluate its exit value and either terminate with a message or present further options to call subsequent scripts.

echo "Welcome to the Website Downloader application"
echo ""

# Purpose: read in the target file URL
while read -p "Please type the URL of the file you would like to download or type 'exit' to quit : " dltarget
URL="$dltarget"
do
# Purpose: exit the script if the user enters 'exit' as the URL - *****not working*****
if [[ "$dltarget" == "exit" ]] ; then
    break
fi

# Purpose: read in the target save location
read -p "Where would you like to save the file? : " folder
folder="$folder"

# Purpose: Download file & save to chosen location
wget -P ~/scripts/portfolio/week3/"$folder" "$URL"

done

exit 0