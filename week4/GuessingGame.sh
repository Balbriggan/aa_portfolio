#!/bin/bash

# GuessingGame.sh - A basic script that uses a function to promprt a user to guess a number with different outsomes.
# Author: Andrew Abel
# Date: 1/August/2021

#This function prints a given error
printError()

{

    echo -e "\033[31mERROR:\033[0m $1"

}

#This function will get a value between the 2nd and 3rd arguments and carry out the logic.
getNumber()

{

    read -p "$1: "

    while (( $REPLY < $2 || $REPLY> $3 )); do

        printError "Input must be between $2 and $3"

        read -p "$1: "
  
    done

    while (( $REPLY < "41" )); do

        echo ""
        txtpur=$(tput setaf 5)
        echo "${txtpur}That number is too low. Please try again."
        echo ""

        read -p "$1: "
  
    done

    while (( $REPLY > "43" )); do

        echo ""
        txtgrn=$(tput setaf 2)
        echo "${txtgrn}That number is too high. Please try again."
        echo ""

        read -p "$1: "
  
    done    

    if [[ "$REPLY" -eq "42" ]] ; then
    echo ""
    txtblu=$(tput setaf 4)
    echo "${txtblu}Winner Winner Chicken Dinner!!"
    echo ""
    #read -p "$1: "
    fi    

}

#This section provides info to user & gathers user input.
echo "This is the start of the Guessing Game script"

txtrst=$(tput sgr0)
getNumber "${txtrst}Please type a number between 1 and 100" 1 100

txtrst=$(tput sgr0)
echo "${txtrst}Thank you for playing. See you next time!"
echo ""

exit 0
