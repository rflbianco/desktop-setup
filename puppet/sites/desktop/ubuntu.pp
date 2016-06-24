include apt

##########################################################
# Unity Tweak Tool
package { 'unity-tweak-tool': ensure  => 'installed' }
package { 'compizconfig-settings-manager': ensure => 'installed' }
package { 'compiz-plugins': ensure => 'installed' }

##########################################################
# Ubuntu Tweak Tool
#apt::ppa { 'ppa:tualatrix/ppa': }
#package { 'ubuntu-tweak':
#  ensure  => 'installed',
#  require => [Apt::Ppa['ppa:tualatrix/ppa']]
#}


##########################################################
# Jayatana (Appmenu indicator support for Java-based applications)
apt::ppa { 'ppa:danjaredg/jayatana': }
package { 'jayatana':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:danjaredg/jayatana']]
}
