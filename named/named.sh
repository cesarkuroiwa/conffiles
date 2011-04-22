#!/bin/sh

# PROVIDE: named
# REQUIRE: DAEMON
# KEYWORD: shutdown

basedir="/storage/named"

case "$1" in
	start|faststart)
		echo "Starting named..."
		if [ ! -d /storage/named ]; then
			echo "Filesystem not mounted!"
			exit 0
		fi
		${basedir}/named_wrapper.sh &
		;;
	stop|faststop)
		echo "Stopping named..."
		kill `cat ${basedir}/named_wrapper.pid`
		kill `cat ${basedir}/named.pid`
		;;
	restart)
		kill `cat ${basedir}/named.pid`
		;;
	*)
		echo "Usage: `basename $0` start | stop"
         	exit 64
         	;;
esac
exit 0
