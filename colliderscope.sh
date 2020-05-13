#!/bin/bash
NICS=()
for iface in $(ifconfig | cut -d ' ' -f1 | tr ':' '\n' | awk NF)
do
    if [ "$iface" != "lo" ]
    then
        #printf "$iface\n"
        NICS+=("$iface")
    fi
done

for nic in "${NICS[@]}"
do
    echo "$nic"
    netstat -i | grep ^$nic | awk '{print $9 / $7 }' 2>/dev/null
done