#!/usr/bin/env bash

#xwaylandvideobridge --qwindowtitle xwlvb &
/usr/lib/polkit-kde-authentication-agent-1 &
/usr/lib/xdg-desktop-portal-hyprland &

wlsunset.sh &
#hyprpaper &
#waybar &
#swaync &

sleep 1

qbittorrent &

steam &
brave &

disown

exit
