#!/bin/sh

# PROVIDE: samba

case "$1" in
	start|faststart)
		echo "Starting samba..."
		/usr/local/samba/sbin/smbd -s /common/samba/etc/smb.conf
		/usr/local/samba/sbin/nmbd -s /common/samba/etc/smb.conf
		;;
	stop|faststop)
		echo "Stopping samba..."
		kill `ps xa | egrep "sbin/smbd|sbin/nmbd" | awk '{ print $1 }'`	
		;;
	*)
		echo "Usage: `basename $0` start | stop"
         	exit 64
         	;;
esac
exit 0
