#!/bin/sh

in=`iptables -L INPUT -vnx | grep spt:119 | grep -v ACCEPT | awk '{ print $2 }'`
out=`iptables -L OUTPUT -vnx | grep dpt:119 | grep -v ACCEPT | awk '{ print $2 }'`
echo $in
echo $out
echo 0
echo 0
