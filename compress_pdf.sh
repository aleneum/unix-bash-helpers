#!/bin/bash

# https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file

# -dPDFSETTINGS=/screen lower quality, smaller size.
# -dPDFSETTINGS=/ebook for better quality, but slightly larger pdfs.
# -dPDFSETTINGS=/prepress output similar to Acrobat Distiller "Prepress Optimized" setting
# -dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting
# -dPDFSETTINGS=/default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file

if [ $# -eq "0" ]
then
	echo USAGE: compress_pdf.sh INPUT_FILE <PDFSETTINGS>
  echo Returns a pdf file named INPUT_FILE_compressed.pdf
  echo Default PDFSETTINGS is 'printer'
	exit 1
fi

quality=$2
options="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH"
quality=${quality:-printer}
cmd="gs $options -dPDFSETTINGS=/$quality -sOutputFile=`echo $1 | sed s/.pdf/_compressed.pdf/` $1"

echo =================
echo execute \"$cmd\"
echo =================
$cmd
