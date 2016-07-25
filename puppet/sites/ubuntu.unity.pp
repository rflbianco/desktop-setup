include apt

##########################################################
# Tweak tools
package { 'unity-tweak-tool': ensure  => 'installed' }
package { 'compizconfig-settings-manager': ensure => 'installed' }
package { 'compiz-plugins': ensure => 'installed' }

##########################################################
# Jayatana (Appmenu indicator support for Java-based applications)
apt::ppa { 'ppa:danjaredg/jayatana': }
package { 'jayatana':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:danjaredg/jayatana']]
}

##########################################################
# Sound switcher indicator
apt::ppa { 'ppa:yktooo/ppa': }
package { 'indicator-sound-switcher':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:yktooo/ppa']]
}
