#!/bin/bash
# AwkFormat.sh - A basic script that uses the AWK command to read in a file and format output.
# Author: Andrew Abel
# Date: 15/August/2021

# Purpose: I editied the spaces in line 17 to make the far right bar align with the following output.

grep "/bin/bash" /etc/passwd > pass.txt

echo ""
echo "User Accounts:"
echo ""

awk 'BEGIN {

    FS=":";

    print "| \033[34mUsername\033[0m                  | \033[34mUserID\033[0m         | \033[34mGroupID\033[0m        | \033[34mHome\033[0m                              | \033[34mShell\033[0m             ";
    print "_____________________________________________________________________________________________________________";

}

{

    printf("| \033[33m%-12s\033[0m              | \033[35m%-14s\033[0m | \033[35m%-14s\033[0m | \033[35m%-33s\033[0m |\033[35m%-10s\033[0m\n", $1, $3, $4, $6, $7);

}

END {

    print("______________________________________________________________________________________________________________");

}' pass.txt
echo ""

exit 0
