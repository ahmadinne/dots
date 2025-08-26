#!/bin/bash

echo "ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", ENV{DISPLAY}=":0", RUN+="/usr/bin/su ahmadinne -c '/home/ahmadinne/.config/scripts/charge 1'"
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", ENV{DISPLAY}=":0", RUN+="/usr/bin/su ahmadinne -c '/home/ahmadinne/.config/scripts/charge 0'"
" > /etc/udev/rules.d/charge.rules
