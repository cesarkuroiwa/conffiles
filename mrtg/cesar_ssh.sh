#!/bin/sh

in=`iptables -L INPUT -vnx | grep dpt:18022 | grep -v ACCEPT | awk '{ print $2 }'`
out=`iptables -L OUTPUT -vnx | grep spt:18022 | grep -v ACCEPT | awk '{ print $2 }'`
echo $in
echo $out
echo 0
echo 0
