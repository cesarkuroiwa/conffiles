#!/bin/sh

loop=4
if [ -n "$1" ];
then
loop=$1
fi

if [ "$loop" -eq "0" ];
then
loop=""
else
loop="-loop $loop"
fi

/usr/bin/mplayer -really-quiet $loop -playlist /home/cesar/playlist -shuffle
