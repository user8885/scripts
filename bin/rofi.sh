#!/usr/bin/env bash

# change this variable to the theme you prefer
layout="rounded"
term="$MY_TERM"
theme_dir="~/.config/rofi/layouts/$layout.rasi"

rofi \
    -show drun \
    -show-icons \
    -terminal $term \
    -kb-cancel Escape \
    -theme $theme_dir
