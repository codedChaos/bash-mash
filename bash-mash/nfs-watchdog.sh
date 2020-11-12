#!/bin/bash

######################
## WORK IN PROGRESS ##
######################

# function to easily get formatted times
function getTime() {
    epoch=$1
    case $epoch in
    before)
        # return past date for comparison
        return $(date -d '-5 minutes')
        ;;
    current)
        # return current time
        return $(date)
        ;;
    after)
        # return later time
        return $(date -d '+5 minutes')
        ;;
    *)
        # default catch-all
        return false
        ;;
    esac
}

# Watch Logs for NFS problems and unmount NFS if found
LOG_FILE='/var/log/syslog.1'
SEARCH_STRING='unable to activate storage'

# read lines in from logfile
while read line; do
    if [[ $(grep "$SEARCH_STRING" "$line") ]]; then
        echo $line

        # need to capture the storage mount name for unmount
        # process. Don't want to unmount something that is
        # active. Might need another test too.

    fi

done <$LOG_FILE

# execute fusermount -uz to unmout stale NFS mounts
for m in "${mounts[@]}"; do
    # unmount drive
    fusermount -uz $m
done

# if successful rotate logfiles
if [ $? == 0 ]; then
    /usr/sbin/logrotate -f /etc/logrotate.d/rsyslog &>/dev/null
fi

tail -n 3000 /var/log/syslog.1 | grep --line-buffered "unable to activate storage" | while read LINE0; do
    echo ${LINE0}
    if [[ "${LINE0}" =~ \'([a-zA-Z-]+[0-9]?)\'[[:space:]]-[[:space:]]directory[[:space:]]\'([\/a-zA-Z\-]+[0-9]?)\' ]]; then
        echo ${BASH_REMATCH[1]} " and " ${BASH_REMATCH[2]}
    else
        echo "NOT FOUND"
    fi
done
