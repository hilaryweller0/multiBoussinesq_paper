#!/bin/bash -e

for file in bubble bubble_singleUnderRes multiFluidBubble_500_1 multiFluidBubble_500_2 multiFluidBubble_1000 RCE_resolved RCE_singleColumn; do
    echo $file

    (cd makeFigs; ./makeFig.sh $file)
done

