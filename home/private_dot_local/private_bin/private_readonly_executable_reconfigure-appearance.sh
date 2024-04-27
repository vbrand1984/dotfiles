#!/bin/sh

# Graphical reconfiguration. With this setup, don't use programs like lxappearance to adjust graphical settings.
# Instead, edit the [gtk.data] section in ~/.config/chezmoi/chezmoi.toml,
# then run chezmoi apply, and after that execute this script

# restart xsettingsd
killall xsettingsd
xsettingsd &

# restart dunst
/bin/sh -e "$HOME/.local/bin/restart-dunst.sh"

# restart tint2
killall -SIGUSR1 tint2

# reconfigure openbox
/bin/sh -e "$HOME/.local/bin/reconfigure-openbox.sh"
