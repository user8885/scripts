#!/usr/bin/env bash

sed -n '/START_KEYS/,/END_KEYS/p' ~/nix/home-manager/modules/hyprland.nix | less

