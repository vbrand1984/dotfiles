#!/bin/sh

# NOTE: Package rofi-calc is absent in Debian/Devuan

case "$1" in
    run)
        exec rofi -modi run -show run
        ;;
    drun)
        exec rofi -modi drun -drun-match-fields name,generic,categories,comment -drun-display-format "<b>{name}</b> [<span weight='light' size='small'><i>({generic})</i></span>] <span weight='light' size='small'>({categories})</span>" -show-icons -show drun
        ;;
    window)
        exec rofi -modi window -show window -show-icons
        ;;
    calc)
        exec rofi -show calc -modi calc -no-show-match -no-sort
        ;;
    *)
        echo 'Usage: either run, drun, window or calc'
        ;;
esac
