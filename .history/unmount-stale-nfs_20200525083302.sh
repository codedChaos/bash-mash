#!/bin/bash

# Check NFS mounts for staleness and unmount if found
# This will cause pvestatd to try to remount them which
# should clean up any issues.

# grab output from glob on /mnt/pve/ folder
list=$(ls /mnt/pve)

for i in $list
do
        status=$(ls /mnt/pve/$i 2>&1)

        if [[ $status =~ .*Stale.* ]]
        then
                umount /mnt/pve/$i
        fi
done
