#!/bin/bash

###############################################################################################
# Usage: change all permissions recursively for a specified directory. In order for this to 
#        work optimally, I've hardcoded the maximum number of files to 20000. Might be a good
#        idea to change it after performing some performance testing.
#
# Example run command: ./change_permissions.sh [DIRECTORY]
###############################################################################################

if [[ -z $1 ]]
then echo "Provide an argument (directory_name) to the script!"
     exit 1
fi

count=$( find ./$1 \( -type d -o -type f \) | wc -l )
echo "There are $count files+dirs that need new permissions!"

if [[ $count -gt 20000 ]]                                       # hardcoded limit ( in order to run script in 8 seconds or less )
then echo "Too many files+dirs that need new permissions!"
     exit 1
else
	if [[ -d $1 ]]
	then 	echo "Directory name is $1"
		SECONDS=0 					# initialize internal SECONDS variable
		find ./$1 -type d -exec chmod 755 {} \;         # change permissions for all dirs
		find ./$1 -type f -exec chmod 744 {} \;	        # change permissions for all files
		echo "SUCCESS! $SECONDS seconds have passed"
	else  	echo "Invalid arg. Must be a directory"
		exit 1
	fi
fi
