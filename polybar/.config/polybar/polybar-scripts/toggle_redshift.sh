#!/usr/bin/env bash
set -euo pipefail

if pidof redshift; then
    pkill redshift
    notify-send -u normal -a Redshift -t 3000 -i ~/.config/dunst/icons/lightbulb.svg "Redshift disabled"
else
    redshift -l 13.09194:80.19917 &
    notify-send -u normal -a Redshift -t 3000 -i ~/.config/dunst/icons/lightbulb.svg "Redshift enabled"
fi
