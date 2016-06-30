include apt

##########################################################
# Gimp from PPA
apt::ppa { 'ppa:otto-kesselgulasch/gimp': }
package { 'gimp':
  ensure => "installed",
  require => [Apt::Ppa['ppa:otto-kesselgulasch/gimp']]
}

##########################################################
# Inkscape from PPA
apt::ppa { 'ppa:inkscape.dev/stable': }
package { 'inkscape':
  ensure => 'installed',
  require => [Apt::Ppa['ppa:inkscape.dev/stable']]
}
