#!/bin/sh

cpu=`awk '{ print $1 }' /proc/loadavg | awk -F. '{ print $1*50 + $2/2 }' | awk -F. '{ print $1 }'`
mem=`free -b | grep Mem | awk '{ print 100*$3/$2 }' | awk -F. '{ print $1 }'`
echo $mem
echo $cpu
echo 0
echo 0
