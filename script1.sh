#!/bin/bash


echo "Main Global Variables:"
echo "HOME: $HOME"
echo "USER: $USER"
echo "SHELL: $SHELL"
echo "PWD: $PWD"
echo "PATH: $PATH"

echo -e "\nShell Arguments:"
echo "Number of arguments: $#"
echo "All arguments: $@"
echo "First argument: $1"
echo "Second argument: $2"

echo -e "\nReturn value of last command: $?"

echo -e "\nPID of current shell: $$"
