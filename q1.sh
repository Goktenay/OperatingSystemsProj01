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

print_dots $n0
print_dots $n1
print_dots $n2
print_dots $n3
print_dots $n4
print_dots $n5
print_dots $n6
print_dots $n7
print_dots $n8
print_dots $n9
