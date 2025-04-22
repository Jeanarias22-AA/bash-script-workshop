#!/bin/bash


echo "Enter the name of a main global variable (e.g., HOME, USER, SHELL, PWD, PATH):"
read global_var

echo "Value of $global_var: ${!global_var}"
echo "Return value of last command (display variable): $?"

echo -e "\nArguments passed to this script:"
echo "Number of arguments: $#"
echo "All arguments: $@"
echo "Return value of last command (display arguments): $?"

echo -e "\nPID of current shell: $$"
echo "Return value of last command (display PID): $?"
