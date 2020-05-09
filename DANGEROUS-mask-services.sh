#!/bin/bash

# command line arguments
args=("$@")
if $# <> 1 then
    echo "Too many args specified: $# specified, but 1 is the maximum."
    echo " "
    echo "command usage: ./mask-services-with-name-like.sh <service name particle> (enter)"
    exit -1
else
    echo "Let's mask some shit!"
    echo "masking: $1..."
    servicename=$1
fi

for i in $(systemctl list-units | grep $servicename | awk '{ print $1 }' | grep $servicename)
    do
        echo "masking and stopping: $i"
        systemctl --now mask $i
    done