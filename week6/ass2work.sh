#!/bin/bash


norm=$(tput sgr0)
txtred=$(tput setaf 1)
txtblu=$(tput setaf 4)
txtgrn=$(tput setaf 2)

#Fetch data from website s for silent mode into temp file html
curl -s https://www.cyber.gov.au/acsc/view-all-content/alerts >> alerts.html

#Prepare headers and save them in CSV file create csv & set the column headers
echo "Date,Title,Link,Summary" > alerts.csv

#Count number of lines for progress bar Display a progress bar for script by counting lines in html & increment by 1 into variable for later use - p Line 10 to 12 count the read
while read p; do
    totallines=$(($totallines+1))
done <alerts.html

progress=0

#Disable Cursor movement when script will run
tput civis

#main loop to find relevant content
while read p; do
    

        #find hyberlink for alert
        if [[ $p ==  *"field-content"* ]];
            then
                asclink=$(grep field-content <<< $p | grep title | grep href | sed -n 's/.*href="\([^"]*\).*/\1/p')
                asclink="https://www.cyber.gov.au$asclink"
        fi


        #find date of alert
        if [[ $p ==  *"acsc-date"* ]];
             then
                ascdate=$(grep acsc-date <<< $p | awk '{print $1, $2, $3, $4}' | awk 'BEGIN {FS=">"} {print $2}')
        fi


        #find title of alert remove comma for csv formatting
        if [[ $p ==  *"acsc-title"* ]];
            then
                asctitle=$(grep acsc-title <<< $p | sed -e 's#<p class="acsc-title">##' -e 's#</p>##' -e 's/,//g' )
        fi


        #find summary of alert
        if [[ $p ==  *"acsc-summary"* ]];
            then
                ascsummary=$(grep acsc-summary <<< $p | sed -e 's#<p class="acsc-summary">##' -e 's#</p>##' -e 's/,//g')

                #combine all finds comma for CSV format
                asc="$ascdate, $asctitle, $asclink, $ascsummary"

                #append final data in CSV file
                echo $asc >> alerts.csv
        fi

        #show progress bar
        echo -n "${txtred}Total Lines: ${norm} $totallines  "

        progress=$(($progress + 1))       
        echo -n "${txtblu}Reading Line Number: ${norm} $progress "
        echo -n "[ "

        #Calcualte percentage based on current line number
        percentage=$((($progress * 100) / $totallines))

        #print # for number of percentage done and the move one space next for next line progress
        for ((i = 0 ; i <= $percentage; i++)); do echo -n "${txtgrn}#${norm}"; done 
        for ((j = $percentage ; j <= 100 ; j++)); do echo -n " "; done
        echo -n " ] "

        echo -ne " ${txtgrn} $percentage %${norm}" $'\r'

done <alerts.html

#Enable cursor movement
tput cvvis

#remove temporaray downloaded file
rm -rf alerts.html

echo ""

exit 0