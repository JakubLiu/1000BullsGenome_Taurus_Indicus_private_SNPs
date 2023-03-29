#!/bin/bash

# QBA LIU 2023 -------------------------------------------------------------------------------------------------------------------------------------------------------

# this script changes the file format that is produced by R to the format required by the Ensembl Variant Effect Predictor tool

echo 'Enter filename: '

read file


sed 's/_/ /g' $file | sed 's! !\/!3' | awk '$3=$2' > left_filepart.txt

sed 's/_/ /g' $file | sed 's! !\/!3' | awk '{print $3}' > right_filepart.txt

paste left_filepart.txt right_filepart.txt | sed 's/\t/ /g' | sed -e 's/$/ 1/' > VEP_$file".txt"


rm left_filepart.txt
rm right_filepart.txt

echo 'done.'
