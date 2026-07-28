#!/usr/bin/env bash

enable_battery=false
battery_charging=false

for battery in /sys/class/power_supply/*BAT*; do
    if [[ -f "$battery/uevent" ]]; then
        enable_battery=true

        if [[ "$(head -1 /sys/class/power_supply/*/status)" == "Charging" ]]; then
            battery_charging=true
        fi

        break
    fi
done

if [[ "$enable_battery" == true ]]; then
    if [[ "$battery_charging" == true ]]; then
        printf '%s' "(+) "
    fi

    printf '%s%%' "$(head -1 /sys/class/power_supply/*/capacity)"

    if [[ "$battery_charging" == false ]]; then
        printf '%s' " remaining"
    fi
fi

printf '\n'
