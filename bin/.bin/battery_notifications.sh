#!/bin/bash

LOW_BATTERY_LEVEL=15
CRITICALLY_LOW_BATTERY_LEVEL=5

while sleep 5; do
	read -r status capacity < <(acpi -b | awk -F'[,:%]' '{print $2, $3}')

	if [ "$status" = Discharging ] && [ "$capacity" -lt $CRITICALLY_LOW_BATTERY_LEVEL ] && [ "$critbatnotsent" != yes ]; then
		critbatnotsent=yes
		notify-send -a "Battery" 'Battery level critically low!' 'Suspending in 60 seconds.' -u "critical" &
	    sleep 60; read -r status capacity < <(acpi -b | awk -F'[,:%]' '{print $2, $3}')
	    if [ "$status" = Discharging ]; then
            systemctl suspend
        fi
    elif [ "$status" = Discharging ] && [ "$capacity" -lt $LOW_BATTERY_LEVEL ] && [ "$lowbatnotsent" != yes ]; then
		lowbatnotsent=yes
		notify-send -a "Battery" 'Battery low!' 'Plug in your charger now.' -u "critical" &

	elif [ "$status" = Charging ] || [ "$capacity" -ge $LOW_BATTERY_LEVEL ]; then
		lowbatnotsent=no
		critbatnotsent=no
	fi
done
