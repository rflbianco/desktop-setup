class ubuntudesktop::security::lastpass {
  $username = 'bianco'

  $lastpass_package_name = 'lplinux.tar.bz2'
  $lastpass_package_path = "/tmp/${lastpass_package_name}"
  $lastpass_package_url = "https://lastpass.com/${lastpass_package_name}"
  $lastpass_installer = '/tmp/install_lastpass.sh'

  $onlyif = 'test ! -f /usr/lib/mozilla/plugins/libnplastpass64.so'

  exec { 'download-lastpass-package':
    command => "wget '$lastpass_package_url' -O '$lastpass_package_path'",
    creates => $lastpass_package_path,
    onlyif  => $onlyif
  }

  exec { 'extract-lastpass-installer':
    command => "tar -xjf '$lastpass_package_path'",
    creates => $lastpass_installer,
    cwd     => '/tmp',
    require => [Exec['download-lastpass-package']],
    onlyif  => $onlyif
  }

  exec { 'install-lasspass':
    command => $lastpass_installer,
    cwd     => '/tmp',
    onlyif  => $onlyif,
    require => [Exec['extract-lastpass-installer']]
  }
}
