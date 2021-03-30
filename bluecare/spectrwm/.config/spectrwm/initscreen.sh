#!/usr/bin/env bash

xrandr --setprovideroutputsource 1 0
xrandr --setprovideroutputsource 2 0
#? sleep 1
autorandr -c
# Should not be necessary if autorandr postswitch hook works:
feh --bg-center --randomize /home/christian/Pictures/wallpapers
