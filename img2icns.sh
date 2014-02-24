#!/bin/bash

if [ "$#" -ne "2" ]
	then
	echo "Name: img2icns"
	echo "Purpose: Creates osx application icons from images."
	echo "Requires: imagemagick, iconutil"
	echo "Usage: img2icns <image name> <icon set name>"
	exit
fi

imgname="$1"
iconset="$2.iconset"

if [ ! -f "$imgname" ]
	then
	echo "Input file $1 does not exist."
	exit
fi

if [ -e "$iconset" ]
	then
	echo "Temporary iconset folder $iconset collides with already existing folder."
	exit
fi

mkdir $iconset
convert $1 -resize 16x16 $iconset/icon_16x16.png
convert $1 -resize 32x32 $iconset/icon_16x16@2x.png
convert $1 -resize 32x32 $iconset/icon_32x32.png
convert $1 -resize 64x64 $iconset/icon_32x32@2x.png
convert $1 -resize 128x128 $iconset/icon_128x128.png
convert $1 -resize 256x256 $iconset/icon_128x128@2x.png
convert $1 -resize 256x256 $iconset/icon_256x256.png
convert $1 -resize 512x512 $iconset/icon_256x256@2x.png
convert $1 -resize 512x512 $iconset/icon_512x512.png
convert $1 -resize 1024x1024 $iconset/icon_512x512@2x.png
iconutil -c icns $iconset
rm -r $iconset
