icon_theme="Papirus-Light"
icon_size="48"
icon_ext="svg"
picname_pattern='Screenshot at %Y-%m-%d %H:%M:%S $wx$h.png'
picdir="${HOME}/Pictures/Screenshots"
scrotopts=""

case "${1}" in
	fullscreen)
		scrotopts="-z"
		;;
	window)
		scrotopts="-zub"
		;;
	selection)
		scrotopts="-zs"
		;;
	*)
		echo "Use this script with parameters: fullscreen, window or selection"
		exit 1
		;;
esac

icon_size_real="${icon_size}x${icon_size}"
scrot_execute="notify-send -i /usr/share/icons/${icon_theme}/${icon_size_real}/emblems/emblem-photos.${icon_ext} -t 3000 'Screenshot Saved' '\$n'"
scrot -e "${scrot_execute}" "${scrotopts}" -F "${picdir}/${picname_pattern}" || ( notify-send -u critical -i "/usr/share/icons/${icon_theme}/${icon_size_real}/status/dialog-error.${icon_ext}" "Epic Fail" "Couldn't save a screenshot in ${picdir}!" ; exit 2 ; )

