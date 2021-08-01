#!/bin/bash

echo RED

#grn='33[32m'
grn=$'\e[1;32m'
echo $grn "this should be green"

#echo $'\e[1;31m'This is a plain text without any color

echo $'\e[1;31m'This is a plain text without any color$'\e[0m'

echo "This is green"

txtblu=$(tput setaf 4)
echo "${txtblu}This is coloured blue except"

#txtund=$(tput sgr 0 1)
#echo "${txtund} This text is underlined"


txtrst=$(tput sgr0) 
echo "${txtrst} the text is now reset"

