#!/bin/bash

DEPENDENCIES='sqlite3'

sudo apt update && sudo apt install -y ${DEPENDENCIES[@]}

INSTALLER_FILE='/tmp/rescuetime.deb'

wget "https://www.rescuetime.com/installers/rescuetime_current_amd64.deb" -O $INSTALLER_FILE \
&& sudo dpkg --install $INSTALLER_FILE
