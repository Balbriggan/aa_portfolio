
#!/bin/bash 

# foldermaker.sh - A basic script to take user input and create a folder.  
# Author: Andrew Abel
# Date: 28/July/2021
      
read -p "Type the name of the folder you would like to create : " folderName 
      
mkdir "$folderName" 

exit 0 
     