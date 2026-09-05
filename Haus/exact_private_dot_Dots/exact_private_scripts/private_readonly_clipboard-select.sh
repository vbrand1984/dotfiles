#!/bin/sh

sel=$( cliphist list | rofi -dmenu -p 'Select' )

[ -n "$sel" ] && echo "${sel}" | cliphist decode | wl-copy

