## echo "welcome to $0, Q4 this program will change numbers into string and gonna print to the same file. "

#!/bin/bash

input=$1
tempString=""	## that will store the new text's content
i=0

## reads the file line by line until file finishes
while IFS= read -r line
do
i=$(( $i + 1 ))	##basic incrementation
  #echo "$i $line"
  word="$line"
  for((j=0; j<${#word}; j++))	## #word is total number of letters in the line
	do
	    letter=${word:j:1}	## takes words one by one
#	    echo -e "$letter j=$j"
	    ascii=$(printf '%d' "'$letter") 	#assigns it to 
#	    let "ascii = ascii"
##	    echo "ascii = $ascii"
	    
	    if [ $ascii -ge 48 ] && [ $ascii -le 57 ]	## if it is a number we change the letter
	    then
	    	case $ascii in	## adding it to the string
	    	48) tempString+="zero";;
	    	49) tempString+="one";;
	    	50) tempString+="two";;
	    	51) tempString+="three";;
	    	52) tempString+="four";;
	    	53) tempString+="five";;
	    	54) tempString+="six";;
	    	55) tempString+="seven";;
	    	56) tempString+="eight";;
	    	57) tempString+="nine";;
	    	*)  echo "$tempString"
	    	esac
	    else
	    	tempString+=$letter	#if it is not we add the letter to string
	    fi
	    
	done
	tempString+=$'\n'
done < "$input"
#echo "$i lines at total"
echo "$tempString" > $1	## finally we change the file content by our new string


