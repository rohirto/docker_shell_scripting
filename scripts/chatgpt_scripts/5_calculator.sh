#!/bin/bash

# Function to perform addition
add() {
    result=$(("$1 + $2"))
    echo "Result: $result"
}

# Function to perform subtraction
subtract() {
    result=$(("$1 - $2"))
    echo "Result: $result"
}

# Function to perform multiplication
multiply() {
    result=$(("$1 * $2"))
    echo "Result: $result"
}

# Function to perform division
divide() {
    if [ "$2" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        result=$(("$1 / $2"))
        echo "Result: $result"
    fi
}

# Check if the correct number of arguments (3) is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <number1> <operator> <number2>"
    exit 1
fi

# Extract input values
num1="$1"
operator="$2"
num2="$3"

# Perform the calculation based on the operator
case "$operator" in
    +) add "$num1" "$num2";;
    -) subtract "$num1" "$num2";;
    \*) multiply "$num1" "$num2";; # Escape * to prevent shell expansion
    /) divide "$num1" "$num2";;
    *) echo "Error: Invalid operator. Use +, -, *, or /.";;
esac
