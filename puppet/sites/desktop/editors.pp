Exec { path => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin' ] }
include apt

package { 'meld' : ensure => 'installed' }


##########################################################
# Sublime text 3
$username = 'bianco'

$sublime_installed_package_path = "/home/${username}/.config/sublime-text-3/Installed Packages"
$sublime_package_control_path = "${sublime_installed_package_path}/Package Control.sublime-package"
$sublime_package_control_url = 'https://sublime.wbond.net/Package Control.sublime-package'

apt::ppa { 'ppa:webupd8team/sublime-text-3': }

package { 'sublime-text-installer':
  ensure => 'installed',
  require => [Apt::Ppa['ppa:webupd8team/sublime-text-3']]
}

exec { 'sublime-installed-package-dir':
  command => "mkdir -p '$sublime_installed_package_path'",
  creates => $sublime_installed_package_path,
  user    => $username,
  group   => $username,
  require => [Package['sublime-text-installer']]
}

exec { 'download-sublime-package-control':
  command => "wget --no-check-certificate '$sublime_package_control_url' -O '$sublime_package_control_path'",
  creates => $sublime_package_control_path,
  user    => $username,
  group   => $username,
  require => [Exec['sublime-installed-package-dir']]
}
