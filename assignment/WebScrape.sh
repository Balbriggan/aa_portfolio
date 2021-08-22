#!/bin/bash
# WebScrape.sh - Assignment two main script for unit CYB6004.
# Author: Andrew Abel
# Date: 18/August/2021

# Script Purpose: This script downloads content from a website into a temp html file, formats it, then exports it to a csv file. 

# Purpose: Declare all text manipulation variables
norm=$(tput sgr0)
txtred=$(tput setaf 1)
txtblu=$(tput setaf 4)
txtgrn=$(tput setaf 2)

#Purpose: Retreive data from the below website and within silent mode export it into a temporary html file.
curl -s https://www.cyber.gov.au/acsc/view-all-content/alerts >> alerts.html

#Purpose: Declare the csv column headers and create the alerts.csv file which will be the populated file after the script runs.
echo "Date,Title,Link,Summary" > alerts.csv

#Purpose: Count the number of lines while incrementing by 1 as the temp html file is read so that a progress bar can be displayed. 
while read p; do
    totallines=$(($totallines+1))
done <alerts.html

progress=0

#Purpose: Disable Cursor movement while the script is running to prevent the cursor flashing around the screen.
tput civis

#Purpose: This is the main loop to find relevant content from the html file. Commands leverage the source code headers and markers. 
#See script report for explanation of how this while loop is configured and command information.
while read p; do
    

        #Purpose: Find hyperlink for the alert so it can be shown in the Link column of the csv file. 
        if [[ $p ==  *"field-content"* ]];
            then
                asclink=$(grep field-content <<< $p | grep title | grep href | sed -n 's/.*href="\([^"]*\).*/\1/p')
                asclink="https://www.cyber.gov.au$asclink"
        fi


        #Purpose: Find the date of the alert so it can be shown in the Date column of the csv file.
        if [[ $p ==  *"acsc-date"* ]];
             then
                ascdate=$(grep acsc-date <<< $p | awk '{print $1, $2, $3, $4}' | awk 'BEGIN {FS=">"} {print $2}')
        fi


        #Purpose: Find the title of the alert and remove the comma to apply correct csv formatting so it can be shown in the Title column of the csv file.
        if [[ $p ==  *"acsc-title"* ]];
            then
                asctitle=$(grep acsc-title <<< $p | sed -e 's#<p class="acsc-title">##' -e 's#</p>##' -e 's/,//g' )
        fi


        #Purpose: Find the summary of the alert so it can be shown in the Summary column of the csv file.
        if [[ $p ==  *"acsc-summary"* ]];
            then
                ascsummary=$(grep acsc-summary <<< $p | sed -e 's#<p class="acsc-summary">##' -e 's#</p>##' -e 's/,//g')

                #Purpose: Combine all retreived data for export to the csv file in the columns defined above.
                asc="$ascdate, $asctitle, $asclink, $ascsummary"

                #Purpose: Append final data to the CSV file.
                echo $asc >> alerts.csv
        fi

        #Purpose: Show the progress bar. Add colours to aid visually.
        echo -n "${txtred}Total Lines: ${norm} $totallines  "

        progress=$(($progress + 1))       
        echo -n "${txtblu}Reading Line Number: ${norm} $progress "
        echo -n "[ "

        #Purpose: Calcualte the progress percentage based on the current line number of the file.
        percentage=$((($progress * 100) / $totallines))

        #Purpose: Print Green # for number of percentage done and the move one space next for next line progress.
        for ((i = 0 ; i <= $percentage; i++)); do echo -n "${txtgrn}#${norm}"; done 
        for ((j = $percentage ; j <= 100 ; j++)); do echo -n " "; done
        echo -n " ] "

        echo -ne " ${txtgrn} $percentage %${norm}" $'\r'

done <alerts.html

#Purpose: Enable cursor movement now that the script is complete.
tput cvvis

#Purpose: Remove the temporary downloaded html file.
rm -rf alerts.html

echo ""
echo ""
echo "Please see the below program execution information for Web Scraping section of the script!"
time sleep 0

exit 0