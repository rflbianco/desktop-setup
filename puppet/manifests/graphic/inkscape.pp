class ubuntudesktop::graphic::inkscape {
  include apt

  apt::ppa { 'ppa:inkscape.dev/stable': }

  package { 'inkscape':
    ensure => 'installed',
    require => [Apt::Ppa['ppa:inkscape.dev/stable']]
  }
}


