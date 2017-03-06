#!/bin/bash

SOURCEDIR="/media/Data/TempDownloads/"

#For each folder in TempDownloads
for folder in $(find "$SOURCEDIR" -maxdepth 1); do
  echo "$folder"
  if [[ $(find "$folder" -maxdepth 1 -name "*.rar" | wc -l) -gt 0 ]]; then
    echo "Found a Rar"
  fi
done
