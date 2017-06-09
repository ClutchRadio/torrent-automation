#torrent-automation
Automation utility for NV-Utility to manipulate torrent files

#Files
mediaDownload.sh
unpackDownload.sh

#Workflow
The mediaDownload.sh script runs on a CRON schedule every night at midnight.
The script scans the source target for any files that are new in the previous 24 hours
AND that do no already exist on the destination; if it finds some, they are downloaded
to the destination directory
