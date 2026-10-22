#!/bin/bash

MAXLIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)
CURRENTLIGHT=$(cat /sys/class/backlight/intel_backlight/actual_brightness)

DELTA=$2

if [ $1 == "up" ]; then
	NEWLIGHT=$(( ${CURRENTLIGHT}+${DELTA} ))	
	if [ $NEWLIGHT -gt $MAXLIGHT ]; then
		NEWLIGHT=$MAXLIGHT
	fi

	echo "$NEWLIGHT" > /sys/class/backlight/intel_backlight/brightness

elif [ $1 == "down" ]; then
	NEWLIGHT=$(( ${CURRENTLIGHT}-${DELTA} ))	
	if [ $NEWLIGHT -lt 200 ]; then
		NEWLIGHT=200
	fi

	echo "$NEWLIGHT" > /sys/class/backlight/intel_backlight/brightness
fi

exit 0
