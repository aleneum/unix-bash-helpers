#!/bin/bash

# https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file

# -dPDFSETTINGS=/screen lower quality, smaller size.
# -dPDFSETTINGS=/ebook for better quality, but slightly larger pdfs.
# -dPDFSETTINGS=/prepress output similar to Acrobat Distiller "Prepress Optimized" setting
# -dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting
# -dPDFSETTINGS=/default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file

quality=$2
options="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH"
quality=${quality:-printer}
cmd="gs $options -dPDFSETTINGS=/$quality -sOutputFile=`echo $1 | sed s/.pdf/_compressed.pdf/` $1"

echo =================
echo execute \"$cmd\"
echo =================
$cmd
