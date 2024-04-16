
# NB Package rofi-calc is absent in Debian/Devuan

rofifont="JetBrains Mono Medium 12"

case $1 in
	run)
		rofi -modi run -show run -font "$rofifont"
		;;
	drun)
		rofi -modi drun -drun-match-fields name,generic,categories,comment -drun-display-format "<b>{name}</b> [<span weight='light' size='small'><i>({generic})</i></span>] <span weight='light' size='small'>({categories})</span>" -show-icons -show drun -font "$rofifont"
		;;
	window)
		rofi -modi window -show window -show-icons -font "$rofifont"
		;;
	calc)
		rofi -show calc -modi calc -no-show-match -no-sort -font "$rofifont"	
		;;
	*)
		echo "Usage: either run, drun, window or calc"
		;;
esac
