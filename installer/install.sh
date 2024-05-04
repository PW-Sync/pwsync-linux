# Copyleft 🄯 2024  PW-Sync Team

#! /bin/bash

clear
echo " < Para Wodna Sync  Linux Installer >"
echo

if [ "$(id -u)" -eq 0 ]; then
	echo " < !! > nuh uh. i no want be root!"
	exit 1
fi

if [ -f "$XDG_CONFIG_HOME/retroarch/retroarch.cfg" ]; then
	configpath="$XDG_CONFIG_HOME/retroarch"
	echo " < * > RetroArch config dir detected: $configpath"
	echo -n " < ? > Is this correct ? [Y/n]       > "
	read ask
	echo
	declare -l ask
	ask=$ask

	if [ ! "$ask" == "y" ] && [ ! "$ask" == "" ]; then
		ask=1
	else
		ask=0
	fi
else
	echo " < ! > RetroArch config dir not found."
	ask=1
fi

while [ "$ask" -eq "1" ]; do
	echo -n " < ? > Please enter full path         > "
	read configpath

	if [ -f "$configpath/retroarch.cfg" ]; then
		ask=0
	else
		echo " < ! > This is not what i expected..."
	fi
done

pwsyncconfig="$XDG_CONFIG_HOME/pwsync"

if [ -d "$pwsyncconfig" ]; then
	echo " < * > Old pwsync config found."
	echo -n " < ? > Overwrite with a new one ? [y/N] > "
	read ask
	echo
	declare -l ask
	ask=$ask

	if [ "$ask" == "y" ]; then
		ask=1
		rm -rf "$pwsyncconfig"
	else
		ask=-1
	fi
else
	ask=1
fi

if [ "$ask" -eq "1" ]; then
	echo " < * > Creating new config files."
	mkdir "$pwsyncconfig"
	echo -e "[prefs]\nretroarch_cfg = '$configpath'\n" > "$pwsyncconfig/config.toml"
fi

# we'll think about that later on :))
