while :
do
	clear
	echo "Please select an option: "
	echo "1. Create histogram"
	echo "2. Encryption"
	echo "3. Delete oldest"
	echo "4. Convert numbers"
	echo "5. Organized files"
	echo "6. Exit"

	read input

	case $input in
		1) echo -n "enter the file name: "; read file
		./q1.sh $file;;

		2) echo -n "enter the name to crypted: "; read name
		echo -n "enter the how much to shifted"; read number
		./q2.sh $name $number;;

		3) echo -n "enter the name: "; read name
		./q3.sh $name;;

		4) echo -n "enter the file name: "; read file
		./q4.sh $file;;

		5) echo -n "enter the argument if exist(such as -R): "; read argument
		echo -n "enter the things to be searched: "; read secondArgument
		./q5.sh $argument $secondArgument;;

		6) exit;;

		*) echo "invalid input, please try again."
	esac
	echo "press enter to continue."
	read
done
