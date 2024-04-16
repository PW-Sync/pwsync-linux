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
