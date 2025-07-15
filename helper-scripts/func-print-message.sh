# vim: set ft=sh ts=4 sw=4:
#
# This file is intended to be sourced in scripts from
# the .chezmoiscripts directory and others
#
# It adds following functions to print coloured messages:
#
# print_message <message> - prints a message with newline
# print_message_no_linebreak <message> - prints a message without newline
# print_message_header <message> - prints a message in a bold color starting from a newline
#

print_message_no_linebreak() {
	the_color='\033[00;36m'
	default_color='\033[00m'
    printf "${the_color}${1}${default_color}"
}

print_message() {
	print_message_no_linebreak "${1}"
	printf "\n"
}

print_message_header() {
	the_color='\033[01;35m'
	default_color='\033[00m'
	printf "\n${the_color}${1}${default_color}\n"
}
