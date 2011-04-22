#!/bin/sh
basedir="/storage/named"
echo $$ > ${basedir}/named_wrapper.pid
while [ true ];
do
	date >> ${basedir}/log/named_wrapper.log
	/usr/local/named/sbin/named -u bind -c ${basedir}/conf/named.conf -f
	if [ -e ${basedir}/named.core ]; then
		mv ${basedir}/named.core ${basedir}/named.core-`date +%Y%m%d%H%M%S`
	fi 
	sleep 2
done 
