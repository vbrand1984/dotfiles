#!/bin/sh

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=1\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'
#| sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3 | \L\1/p'
