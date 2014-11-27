#!/bin/bash

sum=0
avg=0
for f in $(find -name *.gcda)
do
    line=`gcov $f | grep -m1 "Lines executed"`
    percent=`echo $line | grep -oE '[0-9]+\.[0-9]+'`
    total=`echo $line | grep -oE '[0-9]+$'`
    let "sum += total"
    res=`echo "$total * $percent/100" | bc -l`
    avg=`echo "$avg + $res" | bc -l`
done

avg=`echo "$avg/$sum" | bc -l`

echo $avg
echo $sum