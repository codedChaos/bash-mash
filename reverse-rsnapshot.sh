#!/usr/local/bin/bash -x
# DESCRIPTION:
# reverse-rsnapshot script connects to backup target and
# establishes a reverse SSH session it then initiates an
# rsnapshot pull on the backup target side but pointing
# to the SSH tunnel for the disk effectively allowing
# hard-links to be used on files that are transferred to
# the backup target from the remote host

# USAGE: reverse-rsnapshot <server|client> <start|stop> \
# <[alpha|beta|gamma|delta || hourly|daily|weekly...]>
# Place script in crontab and run in accordance with your
# backup needs.

# WARNING:
# Please be careful not to run rsnapshot via crontab or
# manually without the reverse SSH tunnel instantiated as
# it is here in the script, or your backups will fail.

# VARIABLES
# create var to execute hourly, daily, weekly, monthly or
# yearly rsnapshots. This needs to match what is in your
# rsnapshot.conf file for backup names.
# (i.e. alpha, beta... || hourly, daily...)
USAGE="# USAGE: reverse-rsnapshot <server|client> <start|stop> \
<[alpha|beta|gamma|delta || hourly|daily|weekly...]>"

CLIENT_SERVER=${1?"$USAGE"} # are we running on the client or the server?
CMD=${2?"$USAGE"} # start process or cleanup and kill?
IVAL=${3:-alpha} # default to rsnapshot alpha interval (a.k.a. hourly)


# REVERSE SSH TUNNEL establish from dest -> source and
# start SSHD listening on port 1999 for connections and
# forward them back through the tunnel to dest backup target

ssh -vR 1999:localhost:22 root@<IP Address> &
# commented out to attempt to handle the rsnapshot connection
# inside of the rsnapshot.conf file
# ssh -p 1998 root@<IP address>