#!/bin/bash

INSTALLER_FILE='/tmp/toggldesktop.deb'

# Install gstreamer0.10 dependency manually
(dpkg --list | grep -E 'libgstreamer.*0\.10' | grep 'amd64' | grep -E '^ii') || (
       wget http://archive.ubuntu.com/ubuntu/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-1_amd64.deb -P /tmp \
    && wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb -P /tmp \
    && sudo dpkg -i /tmp/libgstreamer*.deb \
)

wget "https://toggl.com/api/v8/installer?app=td&platform=deb64&channel=stable" -O $INSTALLER_FILE \
&& sudo dpkg --install $INSTALLER_FILE



