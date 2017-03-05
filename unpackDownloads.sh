#!/bin/bash

SOURCEDIR="/media/Data/TempDownloads/"

#For each folder in TempDownloads
for folder in $(find "$SOURCEDIR" -maxdepth 1)
