clear
#!/bin/bash

cpy() 
{
	## is there a copy folder already?
	if test ! -d "./copyfolder"
	then
		fileDescriptor=$2 ## file description
		isRecursive=$3 ## if its recursive then 1 else 0
		
		## test if it's recursive
		if test "$isRecursive" -eq 1
		then
			directories=$(ls -d */ 2>/dev/null)
		fi
		
		## Files to copy list
		filesToCopy=$( (ls -p $fileDescriptor ) | grep -v /)

	
		## if there are no files to copy
		if test ! -z "$filesToCopy"
		then
			mkdir copyfolder
			while IFS= read -r line	
			do
			cp "$line" copyfolder ## copy to folder
			done <<<"$filesToCopy"
		fi

		
		## if it's recursive
		if test "$isRecursive" -eq 1
		then
			if test ! -z "$directories"
			then
				while IFS= read -r line
				do
				cd "$1/$line" ## change directory
				cpy "$(pwd)" "$fileDescriptor" "$isRecursive" ## aply recursive call
				cd .. ## pop back to previous directory
				done <<<"$directories"
			fi
		fi
	else
		echo "We already copied the content"
	fi
	
}

firstArg=$1
secondArg=$2

if test "$firstArg" = "-R" -o "$firstArg" = "-r" ## if our first arg is an option
then
	if test -z "$secondArg"
	then
		echo "file name descriptor is missing"
	else
		cpy "$(pwd)" "$secondArg" 1
	fi
else
	if test -z "$firstArg" 
	then
		echo "incorrect number of arguments"
	else
		cpy "$(pwd)" "$firstArg" 0 
	fi
fi


