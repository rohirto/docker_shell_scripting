#!/bin/bash
echo "Enter three numbers: "
read num1
read num2
read num3

largest=$num1

if [ $num2 -gt $largest ]; then
    largest=$num2
fi

if [ $num3 -gt $largest ]; then
    largest=$num3
fi

echo "The largest number is $largest."
