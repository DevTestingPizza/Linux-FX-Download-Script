#!/bin/bash

# Name: Linux FX Download Script
# Description: Script that finds and downloads the latest version of an FX Server (from the fivem runtime website).
# Author: http://github.com/tomgrobbe
# Date: 06-Oct-2017
# Version: 1.0

# Storing the link containing all latest builds in a variable.
link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"

# Download the webpage form above and save it as index.html
wget $link

# Then using some fancy hacky methods, we read the index.html file,
# take what we need (only the last 3 lines, strip leading and trailing characters
# and we grep - (search for lines containing a -, which is only one line).
# Now we end up with the name of the latest build and we use that to make the download
# link for the latest build.
# We save the output of the executed command in a new variable called latestBuild.
latestBuild=$(tail -n 3 index.html | cut -c 10-54 | grep -)

# We remove index.html because we don't need that anymore.
rm index.html

# Then we wget (download) the latest file using the original link, the latest build link, and the file name appended to the end.
# We now end up with te latest version of fx.tar.xz
wget $link$latestBuild"/fx.tar.xz"

