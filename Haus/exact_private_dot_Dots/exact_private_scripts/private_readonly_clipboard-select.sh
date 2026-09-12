#!/bin/sh

sel=$( cliphist list | rofi -dmenu -p 'Select' )

if [ -n "${sel}" ]; then
	echo "${sel}" | cliphist decode | wl-copy
fi

