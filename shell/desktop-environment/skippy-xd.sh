#!/bin/bash

# clone repository from GitHub
git clone https://github.com/richardgv/skippy-xd.git

# install dependencies to build Skippy-XD
sudo apt install libx11-dev libxft-dev libxt-dev libxrender-dev libxcomposite-dev libxdamage-dev libxfixes-dev libxext-dev libxinerama-dev libpng-dev libjpeg-dev libgif-dev

# make and install Skippy-XD
cd skippy-xd
make
sudo make install

# copy configuration file from example to user's folder
cp skippy-xd.sample.rc ~/.config/skippy-xd/skippy-xd.rc

# replaces personal preferences in config file
sed -i 's/switchDesktopOnActivate = false/switchDesktopOnActivate = true/g' ~/.config/skippy-xd/skippy-xd.rc
sed -i 's/showAllDesktops = false/showAllDesktops = true/g' ~/.config/skippy-xd/skippy-xd.rc

# create autostart entry using XDG
#
# It requires to add a keyboard shortcut to enable window picker
# command=skippy-xd --toggle-window-picker
sudo bash -c 'cat > /etc/xdg/autostart/skippy-xd.desktop' <<EOF
[Desktop Entry]
Type=Application
Name=Skippy XD
Comment=Exposé-like fullscreen task/application switcher
Exec=skippy-xd --start-daemon
Terminal=false
Type=Application
EOF
