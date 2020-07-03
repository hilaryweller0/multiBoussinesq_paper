#!/bin/bash -e

if [ "$#" -ne 1 ]
then
   echo usage: makeFig.sh $file
   exit
fi
file=$1

lyx --export pdflatex -f $file
pdflatex $file
#pdf2ps $file.pdf
#makebb $file.ps
#mv $file.ps $file.eps
pdfcrop $file.pdf $file.cropped.pdf
mv $file.cropped.pdf ../figures/$file.pdf
gv ../figures/$file.pdf &

