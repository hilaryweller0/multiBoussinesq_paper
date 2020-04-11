#!/bin/bash -e
cd makeFigs

for file in bubble bubble_singleUnderRes multiFluidBubble_500_1 multiFluidBubble_500_2 multiFluidBubble_1000 RCE_resolved RCE_singleColumn; do
    echo $file
    lyx --export pdflatex -f $file
    pdflatex $file
    pdf2ps $file.pdf
    makebb $file.ps
    mv $file.ps $file.eps
    pdfcrop $file.pdf $file.cropped.pdf
    mv $file.cropped.pdf $file.pdf
    mv $file.eps $file.pdf ../figures
    gv ../figures/$file.eps &
done

cd ..

