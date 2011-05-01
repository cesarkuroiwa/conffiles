#!/bin/sh

in=`iptables -L INPUT -vnx | grep dpt:8888 | grep -v ACCEPT | awk '{ print $2 }'`
out=`iptables -L OUTPUT -vnx | grep spt:8888 | grep -v ACCEPT | awk '{ print $2 }'`
echo $in
echo $out
echo 0
echo 0
