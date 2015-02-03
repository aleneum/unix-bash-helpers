#!/bin/bash
fi=`lsof -n | grep Flash | grep var/folders | awk '{print $9}'`

echo $fi

if [ -z "$fi" ]
then
	echo "no file found"
	exit
fi

size=`du $fi | awk '{print $1}'`
tmp=0

while [ "$size" -ne "$tmp" ]
do
	tmp=$size
	echo $size
	echo "still growing"
	sleep 0.5
	size=`du $fi | awk '{print $1}'`
done

cp $fi out.flv


