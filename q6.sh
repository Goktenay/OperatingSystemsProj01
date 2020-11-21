clear
#!/bin/bash

cpy() 
{

	directories=$(ls -d */ 2>/dev/null)
	filesToCopy=$(ls -p | grep -v /)

	if test ! -z "$filesToCopy"
	then
		mkdir copyfolder
		while IFS= read -r line	
		do
		cp "$line" copyfolder
		done <<<"$filesToCopy"
	fi


	if test ! -z "$directories"
	then
		while IFS= read -r line
		do
		cd "$1/$line"
		cpy "$(pwd)"
		cd ..
		done <<<"$directories"
	fi
	
}


cpy "$(pwd)"
