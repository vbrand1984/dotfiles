# vim: set ft=sh ts=4 sw=4:
#
# This file is intended to be sourced  in shell scripts
# from the .chezmoiscripts directory and others.
# It adds a function which makes a user to enter
# sudo/doas password until he succeeds
#

#
# Usage:
# ensure_sudo_is_working <sudo|doas|/usr/bin/sudo|/usr/bin/doas>
#
# The argument is mandatory and it MUST be one of the values listed
#

ensure_sudo_is_working() {

	sudo_command=''

	case "${1}" in
		'/usr/bin/sudo'|'/usr/bin/doas'|'sudo'|'doas')
			sudo_command="${1}"
			;;
		*)
			echo "Fatal: You call function \`ensure_sudo_is_working' incorrectly!"
			exit 1
			;;
	esac

	sudo_working=1

	while [ $sudo_working -ne 0 ] ; do
		"${sudo_command}" true && sudo_working=0 || sudo_working=1
	done

}
