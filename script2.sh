#!/bin/bash


echo "Enter a variable name:"
read var_name

echo "Enter the variable value:"
read var_value

declare "$var_name"="$var_value"

echo "The value of $var_name is: ${!var_name}"
