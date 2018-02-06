#!/bin/bash

STR=$1 #string to insert
FILEN=$2 # filename in which insertion take place
DATATYPE=$3 #Which type of functions i.e void or int or both
c=0
ARGS=$#
declare -a LINENO
check()
{
	USAGE="USAGE: $(basename $0) <string to insert> <filename> <function datatype: int/void/both>"
	if [ $ARGS -ne "3" ];then
		echo $USAGE
		exit
	fi
	
	if [ $DATATYPE == "both" ];then
		DATATYPE="int$\|void"
	fi	
}

check # To check command line args
echo $DATATYPE
LINENO=($(cat -n "$FILEN" |grep -no "$DATATYPE$"|awk -F':' '{print $1}'))

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
