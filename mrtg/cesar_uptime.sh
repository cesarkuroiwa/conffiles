#!/bin/sh

uptime=`awk '{ print $1 }' /proc/uptime | cut -d. -f 1`
echo $uptime
echo 0
echo 0
echo 0
