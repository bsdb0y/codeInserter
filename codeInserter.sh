#!/bin/bash

STR=$1 #string to insert
FILEN=$2 # filename in which insertion take place
c=0
declare -a LINENO

LINENO=($(cat -n "$FILEN" |grep -no "int$\|void$"|awk -F':' '{print $1}'))

sedder()
{

		d=$(($i+$1+$2))
		#echo "i = $i && d = $d"
		a="p;$d"
		b=$a'a'
		sed -n -i "$b $STR" $FILEN
		#d=$(($d + $c))
}


for i in ${LINENO[*]}
do
	((c++))

	if [ $c -eq "1" ];then
		sedder 2 0
	else
		sedder 1 $c
	fi

done
