#!/bin/bash

fac_func () {
	if [ $1 -eq 1 ]; then
		echo 1
	else
		local tmp=$(($1 - 1))
		local res=$(fac_func $tmp)
		echo $(($res * $1))
	fi
}

read -p "Enter value: " val
res=$(fac_func $val)
echo "The factorial of $val is: $res"
