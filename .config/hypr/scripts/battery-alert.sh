#!/usr/bin/env bash
# Notify once when battery drops past 20% and 10% (on battery only).
# ponytail: polls /sys every 60s; good enough, swap for upower events if you want push.
bat=/sys/class/power_supply/BAT0
warned_20=0 warned_10=0

while true; do
    cap=$(<"$bat/capacity")
    status=$(<"$bat/status")

    if [[ "$status" == "Discharging" ]]; then
        if (( cap <= 10 )) && (( warned_10 == 0 )); then
            notify-send -u critical "Battery critically low" "${cap}% remaining — plug in now" -i battery-caution
            warned_10=1 warned_20=1
        elif (( cap <= 20 )) && (( warned_20 == 0 )); then
            notify-send -u normal "Battery low" "${cap}% remaining" -i battery-low
            warned_20=1
        fi
    else
        # charging/full: re-arm so alerts fire again next discharge
        warned_20=0 warned_10=0
    fi

    sleep 60
done
