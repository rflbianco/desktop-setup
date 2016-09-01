#!/bin/sh

if [ $UID -eq 0 ]; then
  echo "ERROR. Running as root. This script sets Desktop config, you must run it as a regular user."
  exit 1
fi

### Fonts
gsettings set org.gnome.desktop.interface document-font-name "Sans 8"
gsettings set org.gnome.desktop.interface font-name "Ubuntu 8"
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font  "Ubuntu Bold 8"
