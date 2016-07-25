#!/bin/sh
# Purge Mozilla Thunderbird
sudo apt purge thunderbird

# Purge Zeitgeist
zeitgeist-daemon --quit
sudo apt --purge autoremove activity-log-manager-common activity-log-manager-control-center zeitgeist zeitgeist-core zeitgeist-datahub
sudo rm -fr {/root,/home/*}/.local/share/zeitgeist

# Purge Evolution services
# (keep evolution-data-server-common, required by Gnome/Unity)
sudo apt purge evolution-data-server


##########################################################
# Disable multiples services from unity session startup
# Disable through XDG session and Upstart

disableAutostart() {
  enabled_dir=$1
  disabled_dir=$2

  script="${enabled_dir}/${3}"

  if [ ! -d "$disabled_dir" ]; then
    sudo mkdir $disabled_dir
  fi

  if [ -f "${script}" ]; then
    sudo mv "${script}" "$disabled_dir"
  fi
}

disableXdgAutostart() {
  enabled_dir='/etc/xdg/autostart'
  disabled_dir='/etc/xdg/autostart-disabled'
  script="${1}"

  disableAutostart $enabled_dir $disabled_dir $script
}

disableUpstartAutostart() {
  enabled_dir='/usr/share/upstart/xdg/autostart'
  disabled_dir='/usr/share/upstart/xdg/autostart-disabled'
  script="${1}"

  disableAutostart $enabled_dir $disabled_dir $script
}

disableUpstartSession() {
  enabled_dir='/usr/share/upstart/sessions'
  disabled_dir='/usr/share/upstart/sessions-disabled'
  script="${1}"

  disableAutostart $enabled_dir $disabled_dir $script
}

disableXdgAutostart at-spi-dbus-bus.desktop
disableXdgAutostart deja-dup-monitor.desktop
disableXdgAutostart gnome-software-service.desktop
disableXdgAutostart gnome-user-share-obexpush.desktop
disableXdgAutostart gnome-user-share-webdav.desktop
disableXdgAutostart indicator-bluetooth.desktop
disableXdgAutostart indicator-power.desktop
disableXdgAutostart nautilus-autostart.desktop
disableXdgAutostart onboard-autostart.desktop
disableXdgAutostart orca-autostart.desktop
disableXdgAutostart unity-fallback-mount-helper.desktop
disableXdgAutostart update-notifier.desktop
disableXdgAutostart vino-server.desktop
disableXdgAutostart zeitgeist-datahub.desktop

disableUpstartAutostart at-spi-dbus-bus.desktop
disableUpstartAutostart indicator-bluetooth.desktop
disableUpstartAutostart indicator-power.desktop

disableUpstartAutostart update-notifier-*
disableUpstartAutostart at-spi2-registryd.conf
disableUpstartAutostart indicator-bluetooth.conf
disableUpstartAutostart indicator-power.conf
