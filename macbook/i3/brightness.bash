#!/bin/bash
curr=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
if (( "$(( curr - max ))" < 100 )) && [[ "$1" == "up" ]] ; then
	echo "$(( curr + 100 ))" > /sys/class/backlight/intel_backlight/brightness
elif (( "$curr" >= 100 )); then
	echo "$(( curr - 100 ))" > /sys/class/backlight/intel_backlight/brightness
fi
