
start_conky () {
	conky -d
}

stop_conky() {
	pgrep conky >/dev/null 2>&1 && killall conky
}

case $1 in
	start)
		start_conky
		;;
	restart)
		stop_conky
		sleep 1; start_conky
		;;
	stop)
		stop_conky
		;;
	*)
		;;
esac
