#!/bin/bash

filesdir=$1

searchstr=$2

if [ $# -eq 2 ]; then
	echo "Success"	
else
	echo "Missing parameters."
	exit 1
fi

if [ -d ${filesdir} ]; then
	echo "Success"
else
	echo "Invalid path. Please insert a valir dir path"
fi

nlines=$(grep -r ${searchstr} ${filesdir} | wc -l)
echo ${nlines}
nfiles=$(grep -rl ${searchstr} ${filesdir} | wc -l)
echo ${nfiles}
echo "The number of files are ${nfiles} and the number of matching lines are ${nlines}"
