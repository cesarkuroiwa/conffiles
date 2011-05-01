#!/bin/sh

in=`iptables -L INPUT -vnx | grep all | grep -v ACCEPT | grep -v DROP | awk '{ print $2 }'`
out=`iptables -L OUTPUT -vnx | grep all | grep -v ACCEPT | grep -v DROP | awk '{ print $2 }'`
echo $in
echo $out
echo 0
echo 0
