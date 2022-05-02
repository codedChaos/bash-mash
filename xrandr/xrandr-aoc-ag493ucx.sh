#!/usr/bin/env sh
# 5120x1440 @ 30.00 Hz (GTF) hsync: 43.95 kHz; pclk: 293.23 MHz
# Modeline "5120x1440_30.00"  293.23  5120 5360 5896 6672  1440 1441 1444 1465  -HSync +Vsync

MODELINE='"5120x1440_30.00"  293.23  5120 5360 5896 6672  1440 1441 1444 1465  -HSync +Vsync'
MODE='"5120x1440_30.00"'
xDISPLAY="HDMI-1"

#TODO: create failsafe/fallback to known working state without user input after change
#TODO: build in intelligence for dynamically selecting display output and mode

xrandr --newmode $MODELINE

xrandr --addmode $xDISPLAY $MODE

xrandr --output $xDISPLAY --mode $MODE
