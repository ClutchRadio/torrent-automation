#!/bin/bash

SOURCEDIR="/media/Data/TempDownloads/"

#For each folder in TempDownloads
for folder in $(find "$SOURCEDIR" -maxdepth 1); do
  echo "$folder"
  if [[ $(find "$folder" -maxdepth 1 -name "*.rar" -print | wc -l) -gt 0 ]]; then
    echo "Found a Rar, unpacking, renaming, and moving"
    unrar e "$folder"/*.rar "/media/Data/TempDownloads/$folder"
    filebot -rename "$folder"/.mkv --action move --output "/media/Data/Media/Movies/"
  fi
done
