#!/bin/bash
# usage-message.sh

: ${1?"USAGE: $0 ARGUMENT"}

echo "These two lines echo only if cmd-line parameter is given."
echo "cmd-line parameter = \"$1\""

exit 0 # will exit here if cmd-line parameter present.

# Check the exit status both with and without cmd-line parameter.
# if cmd-line parameter present the $? is 0 otherwise it's 1
