include ::apt

apt::ppa { 'ppa:noobslab/themes': }
package { ['arc-theme']:
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:noobslab/themes']]
}

apt::ppa { 'ppa:ravefinity-project/ppa': }
package { ['vivacious-colors-gtk-dark', 'vivacious-colors-gtk-light']:
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:ravefinity-project/ppa']]
}
