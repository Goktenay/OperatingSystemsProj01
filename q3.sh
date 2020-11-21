clear

firstArg=$1 ## Extra path argument
oldestFile=""
directoryInfo=""

if test -z "$firstArg" ## Is first argurment null?
then

	directoryInfo="." ## If we got no extra path, save current directory
else

	directoryInfo="./$firstArg" ## If we got extra path, save relative directory
fi

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

