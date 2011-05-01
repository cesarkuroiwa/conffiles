#!/bin/sh

# PROVIDE: giftd

case "$1" in
	start|faststart)
		echo "Starting giftd..."
		/usr/local/giftd/bin/giftd -d --local-dir=/common/gift
		;;
	stop|faststop)
		echo "Stopping giftd..."
		killall giftd
		;;
	*)
		echo "Usage: `basename $0` start | stop"
         	exit 64
         	;;
esac
exit 0
