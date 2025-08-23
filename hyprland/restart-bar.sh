#!/usr/bin/env bash

#hyprpanel -q &
#killall gjs # make sure its dead
#
#hyprpanel &

pkill waybar
waybar &

disown

exit 0
