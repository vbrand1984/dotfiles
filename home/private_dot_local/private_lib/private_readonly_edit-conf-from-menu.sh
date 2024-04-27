#!/bin/sh
# This script opens a configuration file in a graphical editor.
# It is intended to be invoked from Openbox menu

[ -f $1 ] || exit 1

the_editor='emacsclient --create-frame --alternate-editor=""'

exec env EDITOR=$the_editor chezmoi edit --apply $1

