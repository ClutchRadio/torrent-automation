#!/bin/bash
PROTOCOL="sftp"
URL="riolu.tal0ne.co.uk"
PORT="21976"
LOCALDIR="/media/Data/TempDownloads/"
REMOTEDIR="/rtorrent/downloads/"
USER="*"
PASS="*"
REGEX="*"
LOG="/home/ubuntu/Scripts/logs/mediaDownload.log"

cd $LOCALDIR
if [  $? -ne 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant cd to $LOCALDIR. Please make sure this local directory is valid" >> $LOG
fi

lftp -p $PORT $PROTOCOL://$URL <<- DOWNLOAD
    user $USER "$PASS"
    cd $REMOTEDIR
    mirror -c --newer-than=now-1days --only-newer --no-empty-dirs -P10 --use-pget-n=2 --log=/home/ubuntu/Scripts/logs/mediaDownload-mirror.log
DOWNLOAD

if [  $? -ne 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant download files. Make sure the credentials and server information are correct" >> $LOG
fi
