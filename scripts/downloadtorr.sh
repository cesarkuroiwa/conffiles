#!/bin/sh
#btdownloadcurses.bittornado --max_download_rate 450 --max_upload_rate 15 --max_uploads 3 --minport 18140 --maxport 18150 $1
btlaunchmanycurses.bittornado --max_download_rate 500 --max_upload_rate 15 --max_uploads 3 --minport 18140 --maxport 18150 $1
