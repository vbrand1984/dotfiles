#!/bin/sh
# This script tests whether a computer is a virtual machine or not
# The method is borrowed from neofetch

the_fname='/sys/devices/virtual/dmi/id/product_name'

if [ -r "${the_fname}" ] ; then
    model=$(cat "${the_fname}")
else
    model='unknown'
fi

case "${model}" in
    'Standard PC'*)
        echo -n 'yes'
        ;;
    OpenBSD*)
        echo -n 'yes'
        ;;
    *)
        echo -n 'no'
        ;;
esac
