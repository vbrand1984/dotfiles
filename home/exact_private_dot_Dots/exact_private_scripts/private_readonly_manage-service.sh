#!/bin/sh
# vim: ft=sh

# This file is managed by chezmoi

# This is a utility script to manage some desktop 'services' like conky, dunst, etc.
#
# Usage:
# manage-service.sh {start|stop|restart} <service>
# Where <service> is either conky, dunst, tint2 or xsettingsd.
#
# Not all operations are applicable to either service, see the code below for details.
# This script is invoked from other scripts bound to Openbox menu entries or keybindings.

# {{{ General stuff

urg_std='low'
urg_achtung='critical'

die_with_dignity() {
    echo "Usage: $(basename $0) {start|stop|restasrt} <service>, where <service> is either conky, dunst, tint2 or xsettingsd"
    exit 1
}

# }}}
# {{{ Conky

start_conky () {
    if pgrep --count conky 1>/dev/null 2>&1 ; then
        notify-send --urgency=$urg_std --icon='dialog-warning' 'Conky is already started!'
    else
        conky --daemonize && notify-send --urgency=$urg_std 'Conky started' || notify-send --urgency=$urg_achtung 'Error starting conky!'
    fi
}

stop_conky() {
    if pgrep --count conky 1>/dev/null 2>&1 ; then
        killall conky && notify-send --urgency=$urg_std 'Conky stopped'
    else
        notify-send --urgency=$urg_std --icon='dialog-warning' 'Conky is not running. Nothing to stop.'
    fi
}

do_conky () {
    case "$1" in
        start)
            start_conky
            ;;
        restart)
            stop_conky
            sleep 1
            start_conky
            ;;
        stop)
            stop_conky
            ;;
        *)
            die_with_dignity
            ;;
    esac
}

# }}}
# {{{ Dunst

do_dunst() {
    if [ "x$1" = 'xrestart' ] ; then
        killall dunst
        notify-send --urgency=$urg_std 'Dunst restarted'
    else
        die_with_dignity
    fi
}

# }}}
# {{{ tint2

do_tint2() {
    if [ "x$1" = 'xrestart' ] ; then
        killall -SIGUSR1 tint2
        notify-send --urgency=$urg_std 'Tint2 restarted'
    else
        die_with_dignity
    fi
}

# }}}
# {{{ xsettingsd

start_xsettingsd () {
    if pgrep --count xsettingsd 1>/dev/null 2>&1 ; then
        notify-send --urgency=$urg_std -raw-icon='dialog-warning' 'XSettingsD is already started!'
    else
        xsettingsd &
        [ $? ] && notify-send --urgency=$urg_std 'XSettingsD started' || notify-send --urgency=$urg_achtung 'Error starting XSettingsD!'
    fi
}

stop_xsettingsd () {
    if pgrep --count xsettingsd 1>/dev/null 2>&1 ; then
        killall xsettingsd && notify-send --urgency=$urg_std 'XSettingsD stopped'
    else
        notify-send --urgency=$urg_std --icon='dialog-warning' 'XSettingsD is not running. Nothing to stop.'
    fi
}

do_xsettingsd () {
    case "$1" in
        start)
            start_xsettingsd
            ;;
        restart)
            stop_xsettingsd
            sleep 1
            start_xsettingsd
            ;;
        stop)
            stop_xsettingsd
            ;;
        *)
            die_with_dignity
            ;;
    esac
}

# }}}
# {{{ Main part

[ $# -eq 2 ] || die_with_dignity

case "$2" in
    conky)
        do_conky "$1"
        ;;
    dunst)
        do_dunst "$1"
        ;;
    tint2)
        do_tint2 "$1"
        ;;
    xsettingsd)
        do_xsettingsd "$1"
        ;;
    *)
        die_with_dignity
        ;;
esac

# }}}
