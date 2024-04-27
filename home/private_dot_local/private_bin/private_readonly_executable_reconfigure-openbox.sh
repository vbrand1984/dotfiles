#!/bin/sh

pgrep openbox 1>/dev/null 2>&1

if [ $? ] ; then
    openbox --reconfigure && notify-send 'Openbox reconfigured' || notify-send --urgency=critical 'Error reconfiguring Openbox!'
else
    notify-send --urgency=critical 'Openbox is not running!'
fi
