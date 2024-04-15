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
else
	echo " < ! > RetroArch config dir not found."
	ask=1
	while [ "$ask" -eq "1" ]; do
		echo -n " < ? > Please enter full path         > "
		read configpath

		if [ -f "$configpath/retroarch.cfg" ]; then
			ask=0
		else
			echo " < ! > This is not what i expected..."
		fi
	done
fi
