#!/bin/bash

# regexes.sh - A basic script that performs FOUR seperate grep searches.
# Author: Andrew Abel
# Date: 15/August/2021

# Script Purpose: Run a series of grep searches based on differnet search requirements and display in changing colours. 

# Purpose: Declare all text manipulation variables
bold=$(tput bold)
und=$(tput smul)
nund=$(tput rmul)
norm=$(tput sgr0)
txtred=$(tput setaf 1)
txtblu=$(tput setaf 4)
txtgrn=$(tput setaf 2)
txtpur=$(tput setaf 5)

# Purpose: Find lines starting with sed            
echo ""
echo " ${txtblu} ${und} Here are the lines discovered that start with sed."
echo "${nund}"
grep -r "^sed"
echo "${norm}"
echo "${norm} ${bold} ${und}The sed search is complete."
echo ""
echo "${norm}"

# Purpose: Find lines starting with M or m
echo " ${txtred} ${und}Here are the lines discovered that start with M or m."
echo "${nund}"
grep -r "^[mM]" 
echo ""
echo "${norm} ${bold} ${und}The search for lines starting with M or m is complete."
echo ""
echo ""

# Purpose: Find lines containing 3 digit numbers
echo " ${txtgrn} ${und}Here are the lines discovered to contain three digit numbers."
echo "${nund}"
grep -oE -r '[[:digit:]][[:digit:]][[:digit:]]'
echo ""
echo "${norm} ${bold} ${und}The search for lines containing 3 digit numbers is complete."
echo ""
echo ""

# Purpose: Find lines starting with echo and containing at least 3 words
echo " ${txtpur} ${und}Here are the lines discovered to start with echo and contain at least 3 words."
echo "${nund} ${norm}"
grep -r '^echo\|word2\|word3'
echo ""
echo "${norm} ${bold} ${und}The search for lines starting with echo and containing 3 words or more is complete"
echo ""
echo ""

# Purpose: Find lines containing alphanumeric strings that would make a good password
echo "${und}Here are the lines discovered to start with echo and contain at least 3 words."
echo "${nund} ${norm}"
grep -oE -r '[[:alnum:]][[:digit:]]{7,9}'
echo ""
echo "${norm} ${bold} ${und}The search for alphanumeric strings between 7 and 9 characters is complete.${norm} ${nund}"
echo ""
echo ""

# Purpose: End the program
echo ""
echo ""
echo "${txtred} ${bold} ${und}The search program is now complete. FOUR grep -r commands have been run.${norm} ${nund}"
echo ""
echo ""

exit 0