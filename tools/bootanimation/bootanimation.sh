#!/usr/bin/env bash
# Copyright (C) 2018 The Dirty Unicorns Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Get the source path
WORKING_DIR=$( cd $( dirname $( readlink -f "${BASH_SOURCE[0]}" ) )/../../.. && pwd )
cd $WORKING_DIR/extras/tools/bootanimation/

# Colors
GREEN="\033[01;32m"
RESET="\033[0m"
RED="\033[01;31m"

# Check to see if user input is provided
if [ -z "$1" ]
  then
    echo
    echo -e ${RED}"-- Make sure you provide width & height"${RED}
    echo -e ${GREEN}"For example -- bootanimation 1920 1200"${GREEN}
    echo -e ${RESET}""${RESET}
    # Kick the user
    exit 1
fi

# Check to see if both width and height provided
if (( $# < 2 )); then
    echo
    echo -e ${RED}"-- Make sure you provide width & height"${RED}
    echo -e ${GREEN}"For example -- bootanimation 1920 1200"${GREEN}
    echo -e ${RESET}""${RESET}
    # Kick the user
    exit 1
fi

# Check to see if user input equal up to numbers
if [[ $1 =~ ^-?[0-9]+.?[0]+$ ]]; then
    continue
elif [[ $1 =~ ^\+?[0-9]+.?[0]+$ ]]; then
    continue
else
    echo
    echo -e ${RED}"-- Make sure you provide width & height"${RED}
    echo -e ${GREEN}"For example -- bootanimation 1920 1200"${GREEN}
    echo -e ${RESET}""${RESET}
    # Kick the user
    exit 1
fi

echo
echo
# Backup the desc.txt file
echo "-- Backing up the desc.txt file so we can modify it"
cp desc.txt backupfile
sleep 1
echo
echo -e ${GREEN}"-- Backed up desc.txt file...."${GREEN}
echo -e ${RESET}""${RESET}
# Add in the resolutions to the desc.txt file
echo "-- Editing desc.txt file with your width and height"
sleep 1
echo
echo -e ${GREEN}"-- Done..."${GREEN}
echo -e ${RESET}""${RESET}
sed -i '1s/^/'${1}' '${2}' 24\n/' desc.txt
# All is good, zip up the boot animation
echo "-- Generating the boot animation zip....please wait"
sleep 1
zip -0r bootanimation desc.txt Part0
echo
echo -e ${GREEN}"-- Zip is generated but need to clean up..."${GREEN}
echo -e ${RESET}""${RESET}
# Remove the modified desc.txt file
echo "-- Deleting the modified desc.txt in source"
rm -rf desc.txt
# Add back a unmodified desc.txt file for future use
sleep 1
echo
echo "-- Restoring backed up desc.txt and moving the zip"
echo
mv backupfile desc.txt
# Copy the zip to vendor/du and delete the original
cp -f bootanimation.zip /$WORKING_DIR/du/prebuilt/common/media
rm -rf bootanimation.zip
sleep 2
echo -e ${GREEN}"-- Zip is ready for use under /vendor/du/prebuilt/common/media/"${GREEN}
echo -e ${RESET}""${RESET}
cd $WORKING_DIR
echo
