#!/bin/bash

export WAYLAND_DISPLAY=wayland-1
export XDG_RUNTIME_DIR=/run/user/1000
/usr/bin/wlr-randr --output eDP-1 --off
