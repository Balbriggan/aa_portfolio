#!/bin/bash

# filenames.sh - A basic script that reads a text file & displays output via a while loop & if statements.
# Author: Andrew Abel
# Date: 1/August/2021

# Purpose: Declare the file to be read.
grep . filenames.txt>tmp.txt
 
while read line; do 
        if [ -e "$line" ]; then echo "The $line file exists"
        fi
        if [ -d "$line" ]; then echo "The $line directory is a valid Directory"
        fi
        if [ ! -d "$line" ] && [ ! -e "$line" ] ; then echo "I dont know what that is!"
        fi
 
done <tmp.txt
 
exit 0