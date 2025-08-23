#!/usr/bin/env bash

zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
zypper dup --from packman --allow-vendor-change
zypper install opi
opi codecs
