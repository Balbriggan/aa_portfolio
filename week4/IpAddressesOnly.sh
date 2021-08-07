#!/bin/bash


# Purpose: Call the preliminary script and use sed on the output to filter displayed content.
#( exec "./IpInfo.sh" )

info=$(./IpInfo.sh)

echo "$info" | sed -n '/IP Address/ {
    p
    }'
exit 0