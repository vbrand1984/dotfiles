# This is a workaround script for solving certain problems in sway.
# Namely, after resuming from standby by swayidle:
# 1. Conky is not shown
# 2. swayosd-server is not working
# We restart those programs right away

kill_process_if_it_exists() {
	pgrep -c "$1" 1>/dev/null 2>&1 && killall "$1"
}

kill_process_if_it_exists conky
sleep 1 && conky -p 7 -d

kill_process_if_it_exists swayosd-server
swayosd-server &

