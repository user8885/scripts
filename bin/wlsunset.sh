#!/usr/bin/env bash

pkill wlsunset
wlsunset -T 6500 -t 4600 -S 07:00 -s 18:00 &

disown
exit
