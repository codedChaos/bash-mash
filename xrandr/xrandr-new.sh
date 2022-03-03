#!/bin/bash
# run cvt <x> <y> to get modeline
# <code>cvt 2560 1440 60</code>
# 2560x1440 59.96 Hz (CVT 3.69M9) hsync: 89.52 kHz; pclk: 312.25 MHz
# Modeline "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

#set -o errexit

# set variables for monitor resolution
H_RESOLUTION="3840"
V_RESOLTUION="2160"
REFRESH_RATE="60.00"
XY_RESOLUTION="${H_RESOLUTION}x${V_RESOLUTION}"
NEWMODE=( "${H_RESOLUTION}" "${V_RESOLUTION}" "${REFRESH_RATE}" )
MODELINE=$(gtf "${NEWMODE[@]}" | grep Modeline | \
    sed "s~Modeline [^\w\s]\([0-9]\{2,4\}[x_.]\{0,1\}\)\{4\}[^\w\s]~$( echo "\"${TEST[0]}x${TEST[1]}\" ${TEST[2]}" )~g")
echo -e "Creating new resolution using the following...\nRESOLUTION: $XY_RESOLUTION\nMODELINE: $MODELINE"


# set varibale for log file to output to and create
# with touch, then add permissions
LOGFILE=./xrandr-newmode.log
touch $LOGFILE

# redirect standard out to logfile
# then redirect standard error to standard out
#exec 1>$LOGFILE
#exec 2>&1

# user xrandr to create new modeline and set it on the monitors
#xrandr --newmode $RESOLUTION 312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --verbose --newmode $MODELINE

case $DESKTOP_SESSION in
 #  commented out old cases and left for posterity sake
 #   *plasma*)
 #       echo "Plasma desktop session. Using DP1-1 and DP1-2 for monitor reference." $(date) >> $LOGFILE
 #       xrandr --verbose --addmode DP-1-1 $RESOLUTION
 #       xrandr --verbose --addmode DP-1-2 $RESOLUTION
 #       xrandr --verbose --output DP-1-1 --mode $RESOLUTION
 #       xrandr --verbose --output DP-1-2 --mode $RESOLUTION --right-of DP1-1
 #   	;;
 #   *gnome*)
 #       xrandr --verbose --addmode DP1-1 $RESOLUTION
 #       xrandr --verbose --addmode DP1-2 $RESOLUTION
 #       xrandr --verbose --output DP1-1 --mode $RESOLUTION
 #       xrandr --verbose --output DP1-2 --mode $RESOLUTION --right-of DP1-1
 #   	;;
 #   *)
 #       echo "unknown session, no resolution configured." $(date) >> $LOGFILE
 #   	;;
     *ubuntu*)
        echo "Ubuntu Desktop Session detected." $(date) >> $LOGFILE
        # add xrandr commands to add newmode and set it on the output
        
esac

# end of file
