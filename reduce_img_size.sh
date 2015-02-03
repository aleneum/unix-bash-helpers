#!/bin/bash

if [[ "$#" -ne 2 ]]
	then
	echo "Copies pictures from current directory into target directory and shrinks them if necessary."
	echo "USAGE: reduce_img_size.sh <target_dir> <resolution>"
	exit 0
fi

mkdir -p $1
for i in `ls *.{png,jpg,gif}`
	do convert -resize $2x$2\> $i $1/$i
done