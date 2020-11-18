## echo "welcome to $0, this is project1 q1"
#!/bin/bash
n0=0
n1=0
n2=0
n3=0
n4=0
n5=0
n6=0
n7=0
n8=0
n9=0
input="$1"

i=0
while IFS= read -r line	##reads until file ends
do
i=$(( $i + 1 ))
  #echo "$i $line"
  case $line in	## we calculate the frequencies of numbers
  0) ((n0++));;
  1) ((n1++));;
  2) ((n2++));;
  3) ((n3++));;
  4) ((n4++));;
  5) ((n5++));;
  6) ((n6++));;
  7) ((n7++));;
  8) ((n8++));;
  9) ((n9++));;
  *) echo "this number is not supported"
  exit 1;;
  esac
  
done < "$input"
## echo "$i lines at total"
#echo "$n1"

print_dots(){		## function that prints the dots
for(( j=0;j<$1;j++ ))
do
echo -n "*"
done
echo ""
}

echo -n "0 "; print_dots $n0
echo -n "1 "; print_dots $n1
echo -n "2 "; print_dots $n2
echo -n "3 "; print_dots $n3
echo -n "4 "; print_dots $n4
echo -n "5 "; print_dots $n5
echo -n "6 "; print_dots $n6
echo -n "7 "; print_dots $n7
echo -n "8 "; print_dots $n8
echo -n "9 "; print_dots $n9
