#!/bin/bash

INSTALLER_FILE='/tmp/rescuetime.deb'

wget "https://www.rescuetime.com/installers/rescuetime_current_amd64.deb" -O $INSTALLER_FILE \
&& sudo dpkg --install $INSTALLER_FILE

