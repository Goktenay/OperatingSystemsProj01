clear


firstArg=$1 #  Extra path argument
recursive=0

if test $firstArg = "-R" && test $firstArg = "-r"
then
	firstArg=$2
	recursive=1
fi

oldestFile=""
directoryInfo=""

if test -z "$firstArg" ## Is first argurment null?
then
	echo "directiory cannot be null"
fi


##we gonna take the recursive files, output will be such as
## cla
## caalfsa
## c.txt
recursiveFiles= $(ls c*)
##
recursive= "" 	## dirleri içerecek sadece

while IFS= read -r line	##reads until file ends
do
	letters="$line"

	for ((i=0;i<{#letters};i++))
	do
		letter={letters:i:1}
		if test letter=":"
		then 
			./q5 -R $letters
			recursive+="$letter"
			break;
		fi

	done 
 
done < "$recursiveFiles"





### copyayalcaks
## cp c.txt copied
## !!!recursively!!!


directorySize=$(echo -n $directoryInfo | wc -m) ## Directory size
trimSize=$(expr $directorySize - 1) ## We will use this information in order the trim the path data

oldestFile=$(find "$directoryInfo" -maxdepth 1 -type f -printf '%T+ %p\n' | sort | head -n 1) ## We simply search for the oldest file in the relative directory

fileName=$(echo $oldestFile | awk '{print $NF}') ## Get the meta file name (It still has relative path information) information from oldest file

fileName="${fileName:(2 + $trimSize)}" ## Trim the meta file name so we got pure file name.

fileDirectory="${directoryInfo}/${fileName}" ## This is our relative path information, we will use it to delete the hile.

echo "Do you want to delete $fileName ? (Y/N)"
read -r userDecision

if test "$userDecision" == 'Y' -o "$userDecision" == 'y' ## Check the user input
then
	echo "1 file Deleted"
	rm $fileDirectory ## Delete the file
elif test "$userDecision" == 'n' -o "$userDecision" == 'N' 
then
	echo "Nothing is deleted"
else
	echo "Invalid input"
fi




