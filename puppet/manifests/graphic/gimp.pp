class ubuntudesktop::graphic::gimp {
  include apt

  apt::ppa { 'ppa:otto-kesselgulasch/gimp': }

  package { 'gimp':
    ensure => "installed",
    require => [Apt::Ppa['ppa:otto-kesselgulasch/gimp']]
  }
}
