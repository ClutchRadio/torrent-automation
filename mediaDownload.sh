#!/bin/bash
PROTOCOL="sftp"
URL="riolu.tal0ne.co.uk"
PORT="21976"
LOCALDIR="/media/Data/TempDownloads/"
REMOTEDIR="/rtorrent/downloads/"
USER="nervlabs"
PASS="g7Ml4J9fo5"
REGEX="*"
LOG="/home/ubuntu/Scripts/logs/mediaDownload.log"

cd $LOCALDIR
if [  $? -ne 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant cd to $LOCALDIR. Please make sure this local directory is valid" >> $LOG
fi

lftp -p $PORT $PROTOCOL://$URL <<- DOWNLOAD
    user $USER "$PASS"
    cd $REMOTEDIR
    mirror --newer-than=now-1days --only-newer -P 10 --use-pget-n=2
DOWNLOAD

if [  $? -ne 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant download files. Make sure the credentials and server information are correct" >> $LOG
fi
