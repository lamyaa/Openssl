#!/bin/bash

sum=0
avg=0
currentdir=`pwd`
for f in $(find -name *.gcda)
do
    file=`echo $f | rev | cut -d'/' -f 1 | rev`
    dir=`echo $f | rev | cut -d'/' -f2- | rev`
    cd $dir
    line=`gcov $file | grep -m1 "Lines executed"`
    percent=`echo $line | grep -oE '[0-9]+\.[0-9]+'`
    total=`echo $line | grep -oE '[0-9]+$'`
    let "sum += total"
    res=`echo "$total * $percent/100" | bc -l`
    avg=`echo "$avg + $res" | bc -l`
    cd $currentdir
done

avg=`echo "$avg/$sum" | bc -l`

echo $avg
echo $sum