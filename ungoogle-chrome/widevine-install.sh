#!/bin/bash -eux
# Replace with current Chromium version
_chrome_ver=143.0.7499.146

# Debian's Chromium has a patch to read libwidevinecdm.so in ~/.local/lib
# However, in 79 and newer, you must use the WidevineCdm directory instead of
# the libwidevinecdm.so file
_target_dir=~/.local/lib/WidevineCdm
_move_type=user_directory
# To have it accessible by all users, uncomment the below instead
#_target_dir=/usr/lib/chromium/WidevineCdm
#_move_type=system_directory

mkdir -p /tmp/chromium_widevine
pushd /tmp/chromium_widevine

# Download deb, which has corresponding Widevine version
# Support resuming partially downloaded (or skipping re-download) with -c flag
wget -c https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb
# Use below link for unstable Chrome versions
#wget -c https://dl.google.com/linux/deb/pool/main/g/google-chrome-unstable/google-chrome-unstable_${_chrome_ver}-1_amd64.deb

# Unpack deb
rm -r unpack_deb || true
mkdir unpack_deb
ar x google-chrome-stable_${_chrome_ver}-1_amd64.deb unpack_deb

if [[ "$_move_type" == 'shared_obj' ]]; then
	# Move libwidevinecdm.so to target dir
	mkdir -p $_target_dir
	mv unpack_deb/opt/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so $_target_dir
elif [[ "$_move_type" == 'user_directory' ]]; then
	# Move WidevineCdm to target dir owned by current user
	rm -r $_target_dir || true
	mv unpack_deb/opt/google/chrome/WidevineCdm $_target_dir
elif [[ "$_move_type" == 'system_directory' ]]; then
	# Move WidevineCdm to target dir in root-owned location
	sudo rm -r $_target_dir || true
	sudo mv unpack_deb/opt/google/chrome/WidevineCdm $_target_dir
	sudo chown -R root:root $_target_dir
else
	printf 'ERROR: Unknown value for $_move_type: %s\n' "$_move_type"
	exit 1
fi

popd
rm -r /tmp/chromium_widevine
