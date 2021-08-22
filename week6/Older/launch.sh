#!/bin/bash

options=("Run Script" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Run Script")
            echo ""
            echo "You chose to run the script"
            echo ""
            ( exec "./ass2work.sh" )
            echo ""
            echo "Your script has been run"
            echo ""
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "That's an invalid option. Please try again. $REPLY";;
    esac
done

echo "perm now changed"
find . -type f -name "launch3.sh" -exec chmod 0640 {} \;
echo "changed"

exit 0
