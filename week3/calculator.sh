#!/bin/bash

# calculator.sh - A basic script that performs calculations and changes the colour of text based on use input.
# Author: Andrew Abel
# Date: 1/August/2021

# Script Purpose: Call a different script, evaluate its exit value and either terminate with a message or present further options to call subsequent scripts.

echo "Welcome to the basic Calculator application"

# Purpose: Case Statement based on user input. The case statement performs the colour set and the calculations with.
PS3='Please enter your choice: '
options=("Addition" "Subtraction" "Multiplication" "Division" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Addition")
            echo ""
            txtblu=$(tput setaf 4)
            echo "${txtblu}You chose an Addition operation. These are performed in Blue"
            read -p "Please enter your first number : " num1
            read -p "Please enter your second number : " num2 
            echo ""
            echo "Thank you, your answer is below"
            ans= expr $num1 + $num2
            echo $ans       
            txtrst=$(tput sgr0) 
            echo "${txtrst}Thanks you for playing, the program wil now exit"
            echo ""
            break
            ;;
        "Subtraction")
            echo ""
            txtgrn=$(tput setaf 2)
            echo "${txtgrn}You chose a Subtraction operation. These are performed in Green"
            read -p "Please enter your first number : " num1
            read -p "Please enter your second number : " num2 
            echo ""
            echo "Thank you, your answer is below"
            ans= expr $num1 - $num2
            echo $ans       
            txtrst=$(tput sgr0) 
            echo "${txtrst}Thanks you for playing, the program wil now exit"
            echo ""
            break
            ;;
        "Multiplication")
            echo ""
            txtred=$(tput setaf 1)
            echo "${txtred}You chose a Multiplication operation. These are performed in Red"
            read -p "Please enter your first number : " num1
            read -p "Please enter your second number : " num2 
            echo ""
            echo "Thank you, your answer is below"
            ans= expr $num1 \* $num2
            echo $ans       
            txtrst=$(tput sgr0) 
            echo "${txtrst}Thanks you for playing, the program wil now exit"
            echo ""
            break
            ;;
        "Division")
            echo ""
            txtpur=$(tput setaf 5)
            echo "${txtpur}You chose a Division operation. These are performed in Purple"
            read -p "Please enter your first number : " num1
            read -p "Please enter your second number : " num2 
            echo ""
            echo "Thank you, your answer is below"
            ans= expr $num1 / $num2
            echo $ans       
            txtrst=$(tput sgr0) 
            echo "${txtrst}Thanks you for playing, the program wil now exit"
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