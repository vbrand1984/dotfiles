#!/bin/echo This script is intended to be sourced, not executed directly
#
# This script is called from the modify_ script for the Openbox' rc.xml 
# configuration file. It cuts the <keyboard> and <applications> tags
# from the existing rc.xml and replaces them with corresponding
# <xi:include /> tags. These sections of Openbox configuration
# are stored in separate files: keyboard.xml and applications.xml
# respectively.
#

BEGIN {

	# Status of the <keyboard> tag processing:
	# 0 - not encountered yet;
	# 1 - is being processed (so, skip the lines)
	# 2 - have already been processed
	keyboard_tag = 0;

	# Same for the <applications> tag
	applications_tag = 0;
}

{ line_printed = 0; }

# <keyboard> tag is still not found and <applications> tag is not being processed
keyboard_tag == 0 && applications_tag != 1 {
	if ( $0 ~ /<keyboard>/ ) {
		print "  <xi:include href=\"keybindings.xml\"/>";
		keyboard_tag = 1;
	}
	else {
		print $0;
		line_printed = 1;
	}
}

# <applications> tag is still not found and <keyboard> tag is not being processed
applications_tag == 0 && keyboard_tag != 1 {
	if ( $0 ~ /<applications>/ ) {
		print "  <xi:include href=\"applications.xml\"/>"
		applications_tag = 1
	}
	else {
		if ( ! line_printed ) print $0;
		next;
	}
}

# <keyboard> tag is being processed; skip the line
keyboard_tag == 1 {
	if ( $0 ~ /<\/keyboard>/ ) {
		keyboard_tag = 2;
		next;
	}
}

# <applications> tag is being processed; skip the line
applications_tag == 1 {
	if ( $0 ~ /<\/applications>/ ) {
		applications_tag = 2;
		next;
	}
}

# Both tags have been processed; just flush input to output.
keyboard_tag == 2 && applications_tag == 2

# If stdin was empty, return a non-zero exit code
END {
	if ( NR == 0 )
		exit 1;
	else
		exit 0;
}

