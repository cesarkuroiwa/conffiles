#!/bin/sh

in=`iptables -L INPUT -vxn | grep pt:53 | grep -v ACCEPT | awk 'BEGIN { total = 0; } { total += $2 } END { print total }'`
out=`iptables -L OUTPUT -vxn | grep pt:53 | grep -v ACCEPT | awk 'BEGIN { total = 0; } { total += $2 } END { print total }'`
echo $in
echo $out
echo 0
echo 0
