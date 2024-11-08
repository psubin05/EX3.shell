#!/bin/bash

num1=$1
operator=$2
num2=$3

if test "$operator" = "+"; then
	result=$((num1 + num2))
elif test "$operator" = "-"; then
	result=$((num1 - num2))

fi

echo $result

