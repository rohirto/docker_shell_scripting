#!/bin/bash
echo "Enter the value of N: "
read n

a=0
b=1
count=0

while [ $count -lt $n ]; do
    echo -n "$a "
    temp=$a
    a=$b
    b=$((temp + b))
    count=$((count + 1))
done
