#!/bin/bash
# This is a bash script!

# This is a bash function to url-decode a string
# Directory names in cyrillic appear to be url-encoded by the basename command
# Thus we need a decoding function
# Don't ask me, how it works, just look here:
# https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell
function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

filemanager="xdg-open"
icon_theme="Papirus-Light"
bookmarks_file="$HOME/.config/gtk-3.0/bookmarks"
user_dirs_file="$HOME/.config/user-dirs.dirs"

[[ -f ${bookmarks_file} ]] || exit 1

[[ -f ${user_dirs_file} ]] && . ${user_dirs_file}

echo '<openbox_pipe_menu>'

for bookmark in $(sed 's/[ ][^ ]*$//' "${bookmarks_file}") ; do
	item_name=$(basename ${bookmark})
	decoded_name=$(urldecode ${item_name})
	icon_name="folder"
	case ${bookmark} in
		"file://${XDG_DOCUMENTS_DIR}" )
			icon_name="folder-documents"
			;;
		"file://${XDG_DOWNLOAD_DIR}" )
			icon_name="folder-download"
			;;
		"file://${XDG_PICTURES_DIR}" )
			icon_name="folder-pictures"
			;;
		* )
			;;
	esac
	echo '<item label="'"${decoded_name}"'" icon="/usr/share/icons/'${icon_theme}'/22x22/places/'"${icon_name}"'.svg">'
	echo '<action name="Execute"><execute>'
	echo "${filemanager} ${bookmark}"
	echo '</execute></action>'
	echo '</item>'
done

echo '</openbox_pipe_menu>'
