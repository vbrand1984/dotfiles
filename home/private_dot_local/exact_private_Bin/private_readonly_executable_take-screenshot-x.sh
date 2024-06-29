#!/bin/sh

die() {
    notify-send --urgency=critical 'Epic Fail' "$1"
    exit 1
}

picname_pattern='Screenshot at %Y-%m-%d %H:%M:%S $wx$h.png'
delay_interval=5
user_dirs_file="${HOME}/.config/user-dirs.dirs"

[ -r "${user_dirs_file}" ] && . "${user_dirs_file}"
picdir="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"

if [ ! -d "$picdir" ] ; then
    mkdir -p "$picdir" || die "Could not create directory $picdir!"
fi

scrotopts=""

case "$1" in
    fullscreen)
        scrotopts='-z' # --silent
        ;;
    window)
        scrotopts='-zbu' #--silent --focused --border
        ;;
    selection)
        scrotopts='-zs' #--silent --select
        ;;
    *)
        echo 'Use this script with parameters: fullscreen, window or selection'
        echo "with optional second parameter 'delay' to delay the screenshot for $delayinterval seconds"
        exit 1
        ;;
esac

if [ "x$1" != 'xselection' ] && [ -n "$2" ] && [ "x$2" = 'xdelay' ] ; then
    scrotopts="${scrotopts}d$delay_interval"
    notify-send -t 3000 "Taking a $1 screenshot in $delay_interval seconds..."
fi

scrot_execute="notify-send -A 'open_dir,Open Directory' -i 'emblem-photos' -t 3000 'Screenshot Saved' '\$n'"
got_action=$(scrot -e "$scrot_execute" "$scrotopts" -F "$picdir/$picname_pattern" || die "Couldn't save a screenshot in $picdir!")

if [ "x$got_action" = 'xopen_dir' ] ; then
    exec xdg-open "$picdir"
fi

