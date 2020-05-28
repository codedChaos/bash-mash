#!/bin/bash
# legnth.sh

# playing with script arguments
# educational only

E_NO_ARGS=65

if [ $# -eq 0 ]; then
    echo "please invoke script with args"
    exit $E_NO_ARGS
fi

var01=abcdDAAGASD
echo "var01 = ${var01}"
echo "length: ${#var01}"
var02="abcd DAAGASD"
echo "var02 = ${var02}"
echo "length: ${#var02}"

echo "number of cmd args passed to script = ${#@}"
echo "number of cmd args passed to script = ${#*}"

exit 0
