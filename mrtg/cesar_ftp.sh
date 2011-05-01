#!/bin/sh

in=`iptables -L INPUT -vnx | egrep "(dpt:18021|dpt:1815[1-3])" | grep -v ACCEPT | awk 'BEGIN { total = 0; } { total += $2 } END { print total }'`
out=`iptables -L OUTPUT -vnx | egrep "(spt:18021|spt:1815[1-3])" | grep -v ACCEPT | awk 'BEGIN { total = 0; } { total += $2 } END { print total }'`
echo $in
echo $out
echo 0
echo 0
