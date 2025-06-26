#!/bin/bash

HISTFILE=~/.bash_history
HISTCONTROL='ignoreboth:erasedups'

# We need to specify these numbers as in ~/.bashrc
HISTSIZE=10000
HISTFILESIZE=5000

cleared_history=$(mktemp 'bash_history_cleared.tmp.XXXXXXXXX')

# Make a backup copy of history file
cp ${HISTFILE} ${HISTFILE}.old 

# Delete duplicate entries in ~/.bash_history
# See: https://unix.stackexchange.com/a/78846
tac ${HISTFILE} | awk '!x[$0]++' | tac > "${cleared_history}"


set -o history

    # The intendation is needed in order for the following commands
    # not to be added in history
    history -c
    history -r "${cleared_history}"
    history -w ${HISTFILE}
    rm "${cleared_history}"
