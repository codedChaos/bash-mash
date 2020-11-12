#!/bin/bash
# run cvt <x> <y> to get modeline
# <code>cvt 2560 1440 60</code>
# 2560x1440 59.96 Hz (CVT 3.69M9) hsync: 89.52 kHz; pclk: 312.25 MHz
# Modeline "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

#set -o errexit

# set variables for monitor resolution
RESOLUTION="2560x1440@60xrandr"
MODELINE=$(gtf 2560 1440 60 | grep Modeline | sed "s/Modeline\s\"2560x1440_60.00\"\s/$RESOLUTION/g")
echo "Setting $RESOLUTION with $MODELINE"


# set varibale for log file to output to and create
# with touch, then add permissions
LOGFILE=~/scripts/xrandr.log
touch $LOGFILE

# redirect standard out to logfile
# then redirect standard error to standard out
#exec 1>$LOGFILE
#exec 2>&1

# user xrandr to create new modeline and set it on the monitors
#xrandr --newmode $RESOLUTION 312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --verbose --newmode $MODELINE

case $DESKTOP_SESSION in
    *plasma*)
        echo "Plasma desktop session. Using DP1-1 and DP1-2 for monitor reference." $(date) >> $LOGFILE
        xrandr --verbose --addmode DP-1-1 $RESOLUTION
        xrandr --verbose --addmode DP-1-2 $RESOLUTION
        xrandr --verbose --output DP-1-1 --mode $RESOLUTION
        xrandr --verbose --output DP-1-2 --mode $RESOLUTION --right-of DP1-1
    	;;
    *gnome*)
        xrandr --verbose --addmode DP1-1 $RESOLUTION
        xrandr --verbose --addmode DP1-2 $RESOLUTION
        xrandr --verbose --output DP1-1 --mode $RESOLUTION
        xrandr --verbose --output DP1-2 --mode $RESOLUTION --right-of DP1-1
    	;;
    *)
        echo "unknown session, no resolution configured." $(date) >> $LOGFILE
    	;;
esac

# end of file
