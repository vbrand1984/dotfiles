[ -f $1 ] || exit 1

#emacsclient --no-wait --reuse-frame --alternate-editor="" $1
alacritty -e vim $1
