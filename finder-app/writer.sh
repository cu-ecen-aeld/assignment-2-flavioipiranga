#!/bin/bash

writefile=$1
writestr=$2

if [ $# -eq 2 ]; then
        echo "Success"  
else
        echo "Missing parameters."
        exit 1
fi

dirpath=$(dirname ${writefile})
filename=$(basename ${writefile})

mkdir -p ${dirpath}
touch ${dirpath}/${filename}  
RETURN=$#

if [ $RETURN ]; then
        echo ${writestr} > ${dirpath}/${filename}
else
        echo "Invalid path. Please insert a valir dir path"
fi

