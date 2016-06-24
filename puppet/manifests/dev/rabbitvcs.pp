class ubuntudesktop::dev::rabbitvcs {
  
  include apt

  apt::ppa { 'ppa:rabbitvcs/ppa': }

  package { ['rabbitvcs-core', 'rabbitvcs-cli']:
    ensure  => 'latest',
    require => [Apt::Ppa['ppa:rabbitvcs/ppa']]
  }
}