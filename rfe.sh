#!/bin/bash

# Rename file extensions in a dir

E_BAD_ARGS=65

case $# in
    0|1)
        echo "USAGE: `basename $0`  <old_file_suffix> <new_file_suffix>" 
        exit $E_BAD_ARGS
    ;;
esac


for filename in *.$1
do
    mv $filename ${filename%$1}$2
done

exit 0
