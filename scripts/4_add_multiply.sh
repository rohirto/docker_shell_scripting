#!/bin/bash

# Prompt to enter numbers
echo "Enter a number: "
read num1
echo "Enter another number: "
read num2

# Add and Multiply
sum=$((num1 + num2))
product=$((num1 * num2))

# Display Output 
echo "Sum is $sum and product is $product"