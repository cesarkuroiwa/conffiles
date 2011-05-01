#!/bin/sh

/usr/local/bin/noip2
sleep 5
killall noip2
ip=`dig kuroiwa.no-ip.org a +short`
now=`date +%Y%m%d-%H:%M:%S`
echo $now $ip >> /root/myip
