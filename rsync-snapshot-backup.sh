#!/bin/bash

#copy old time.txt to time2.txt

yes | cp ~/backup/time.txt ~/backup/time2.txt

#overwrite old time.txt file with new time

echo `date +%F-%I%p` > ~/backup/time.txt

#make the log file

echo “” > ~/backup/rsync-`date +%F-%I%p`.log

#rsync command

rsync -avzhPR --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r --delete --stats --log-file=/home/wsmyth/backup/rsync-`date +%F-%I%p`.log --include='.ssh/' --exclude-from 'exclude.txt' --link-dest=../`cat ~/backup/time2.txt` -e 'ssh -p 22' /home/wsmyth/ wsmyth@box01:/znation/backups/rsync/`hostname`/`date +%F-%I%p`/

#don’t forget to scp the log file and put it with the backup

scp -P 22 /home/wsmyth/backup/rsync-`cat ~/backup/time.txt`.log wsmyth@box01:/znation/backups/rsync/`hostname`/`cat ~/backup/time.txt`/rsync-`cat ~/backup/time.txt`.log
