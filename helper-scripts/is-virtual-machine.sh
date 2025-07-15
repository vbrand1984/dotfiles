#!/bin/echo This script is not intended to be executed directly. Run it as /bin/sh
#
# This script tests whether a computer is a virtual machine or not
# The method is borrowed from neofetch
#

model='unknown'

for the_fname in \
	'/sys/devices/virtual/dmi/id/product_name' \
	'/sys/firmware/devicetree/base/model' \
	'/tmp/sysinfo/model'
	do
		if [ -r "${the_fname}" ] ; then
			model=$(cat "${the_fname}")
			break
		fi
	done

case "${model}" in
	'Standard PC'*|VirtualBox*|OpenBSD*)
		printf 'yes'
		;;
	*)
		printf 'no'
		;;
esac
