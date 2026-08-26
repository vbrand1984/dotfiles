# This is a workaround script for solving certain problems in sway.
# Namely, after resuming from standby by swayidle:
# 1. Conky is not shown
# 2. swayosd-server is not working
# We restart those programs right away

kill_process_if_it_exists() {
	pgrep --count "$1" 1>/dev/null 2>&1 && killall -KILL "$1"
}

kill_process_if_it_exists conky
# Starting conky without a pause doesn't work out
sleep 1 && conky --pause=7 --daemonize

kill_process_if_it_exists swayosd-server
swayosd-server &

