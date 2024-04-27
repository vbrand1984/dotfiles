#!/bin/sh

start_conky () {
    conky --daemonize
}

stop_conky() {
    if pgrep --count conky 1>/dev/null 2>&1 ; then
        killall conky && notify-send 'Conky stopped'
    fi
}

case $1 in
    start)
        start_conky
        ;;
    restart)
        stop_conky
        sleep 1
        start_conky && notify-send 'Conky started'
        ;;
    stop)
        stop_conky
        ;;
    *)
        ;;
esac
