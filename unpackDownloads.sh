#!/bin/bash

SOURCEDIR="/media/Data/TempDownloads/"

#For each folder in TempDownloads
for folder in $(find "$SOURCEDIR" -maxdepth 1) do
  echo "$folder"
  if (find "$folder" -maxdepth 1 -name "*.rar") == TRUE do
    echo "Found a Rar"
  done
done
