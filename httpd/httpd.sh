#!/bin/sh

# PROVIDE: httpd

case "$1" in
	start|faststart)
		echo "Starting httpd..."
		/usr/local/httpd/bin/httpd -f /common/httpd/conf/httpd.conf -k start
		;;
	stop|faststop)
		echo "Stopping httpd..."
		/usr/local/httpd/bin/httpd -f /common/httpd/conf/httpd.conf -k stop
		;;
	restart)
		echo "Restarting httpd..."
		/usr/local/httpd/bin/httpd -f /common/httpd/conf/httpd.conf -k restart
		;;
	*)
		echo "Usage: `basename $0` start | stop"
         	exit 64
         	;;
esac
exit 0
