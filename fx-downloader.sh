#!/bin/bash

# Name: Linux FX Download Script
# Description: Script that finds and downloads the latest version of an FX Server (from the fivem runtime website).
# Author: http://github.com/tomgrobbe
# Date: 06-Oct-2017
# Version: 1.1
# Usage: ./fx-downloader.sh [previous version number (default: 0 for latest build)]
# Example: We want to download the latest version, latest build is build #400
# ./fx-downloader.sh 0
# Example: We want to download 2 versions BEFORE the latest build, latest build is #400 (we want build #398)
# ./fx-downloader.sh 2

# Storing the link containing all latest builds in a variable.
link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"

# Download the webpage form above and save it as index.html
wget $link

# Get the amount of versions to go back to from the argument passed while executing this script
# use 0 for the latest version.
version=$(($1 + 3))


# Then using some fancy hacky methods, we read the index.html file,
# take what we need (only the last 3 lines, strip leading and trailing characters
# and we grep - (search for lines containing a -, which is only one line).
# Now we end up with the name of the latest build and we use that to make the download
# link for the latest build.
# We save the output of the executed command in a new variable called latestBuild.
latestBuild=$(tail -n $version index.html | head -n 1 | cut -c 10-54)

# We remove index.html because we don't need that anymore.
rm index.html

# Then we wget (download) the latest file using the original link, the latest build link, and the file name appended to the end.
# We now end up with te latest version of fx.tar.xz
wget $link$latestBuild"/fx.tar.xz"

echo "#####################################################################"

echo "  Downloaded version: $latestBuild"

echo "#####################################################################"
