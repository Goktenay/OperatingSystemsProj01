
chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}


declare numOfInput="$2"
let numOfInput="numOfInput/10"
#echo "number of input: $numOfInput"
#a=$(printf '%d' "'a")
#z=$(printf '%d' "'z")
#echo "a=$a, z=$z"
#let "diff = z-a"
#echo "diff=$diff"

declare input2="$2"
#echo -e "input2 = $input2\n"

word="$1"
for((i=0; i<${#word}; i++))
do
	letter=${word:i:1}
	#echo -e "$letter i=$i"
	ascii=$(printf '%d' "'$letter")
	#let "ascii = ascii"
	#echo "ascii = $ascii"

if [ $numOfInput -ne 0 ]
then
	number=${input2:i:1}
	#echo "-number- : $number "
fi


	if [ $ascii -ge 97 ] && [ $ascii -le 122 ]	
	then
		let "ascii = ascii + number "
		#echo -e "after add number = $ascii"
		let "ascii = ascii - 97"
	    #echo "ascii after -97 = $ascii"
	    let "ascii = ascii % 26"
	    #echo "after mod 26 = $ascii"
	    let "ascii = ascii + 97"
	    #echo "after add 97 =$ascii"
	    chr $ascii
	    #echo -e "\n\n"
	elif [ $ascii -ge 65 ] && [ $ascii -le 90 ]	
	then
		let "ascii = ascii + number "
		#echo -e "after add number = $ascii"
		let "ascii = ascii - 65"
	    #echo "ascii after -65 = $ascii"
	    let "ascii = ascii % 26"
	    #echo "after mod 26 = $ascii"
		let "ascii = ascii + 65"
	    #echo "after add 65 =$ascii"
		chr $ascii
	    #echo -e "\n\n"

	fi


done
echo -e "\n"

