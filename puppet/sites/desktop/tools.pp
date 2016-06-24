include apt

##########################################################
# monitoring tools
package { 'htop': ensure => 'installed' }
package { 'iotop': ensure => 'installed' }
package { 'lsb-base': ensure => 'installed' }
package { 'lsb-release': ensure => 'installed' }

##########################################################
# compression tools
package { 'p7zip': ensure => 'installed' }
package { 'rar': ensure => 'installed' }

##########################################################
# package management
package { 'synaptic': ensure => 'installed' }
package { 'aptitude': ensure => 'installed' }


##########################################################
# disk utility
package { 'gparted': ensure => 'installed' }

apt::ppa { 'ppa:gezakovacs/ppa': }
package { 'unetbootin':
  ensure => 'installed',
  require => [Apt::Ppa['ppa:gezakovacs/ppa']]
}

##########################################################
# configuration
package { 'dconf-editor': ensure => 'installed' }
