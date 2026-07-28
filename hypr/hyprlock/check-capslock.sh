#!/usr/bin/env bash

main_kb_caps="$(
    hyprctl devices |
        grep -B 6 "main: yes" |
        grep "capsLock" |
        head -1 |
        awk '{print $2}'
)"

if [[ "$main_kb_caps" == "yes" ]]; then
    printf '%s\n' "Caps Lock active"
fi
