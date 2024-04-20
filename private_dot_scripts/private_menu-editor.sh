[ -f "${1}" ] || exit 1

term_emul='x-terminal-emulator'
#the_editor="${EDITOR}"
the_editor="emacs"

#emacsclient --no-wait --reuse-frame --alternate-editor="" $1
#alacritty -e vim $1

#EDITOR="${term_emul} -e ${the_editor}" chezmoi edit --apply "${1}"
exec env EDITOR="${the_editor}" chezmoi edit --apply "${1}"

