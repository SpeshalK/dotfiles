#!/bin/bash

LOCKSCRIPT=~/.config/sway/swayscripts/swaylock/blurlocker.sh

response=$(echo -e "Cancel\n1. Shutdown\n2. Restart\n3. Sleep" | \
	wofi -dmenu -G -x 1700 -W 250 -p "Power Options")

if [ "$response" == "1. Shutdown" ]; then
	shutdown now
elif [ "$response" == "2. Restart" ]; then
	shutdown -r now
elif [ "$response" == "3. Sleep" ]; then
	$LOCKSCRIPT && systemctl suspend
else
	exit 0
fi
