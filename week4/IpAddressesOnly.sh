#!/bin/bash
# IpAddressOnly.sh - Bash script that uses the sed command for unit CYB6004 week 4.
# Author: Andrew Abel
# Date: Updated 22/August/2021

# Purpose: Call the preliminary script and use sed on the output to filter displayed content.
#( exec "./IpInfo.sh" )

info=$(./IpInfo.sh)

echo "$info" | sed -n '/IP Address/ {
    p
    }'
exit 0