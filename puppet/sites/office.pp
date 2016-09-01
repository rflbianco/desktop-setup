include apt

apt::ppa { 'ppa:libreoffice/ppa': }
package { ['libreoffice', 'libreoffice-style-sifr', 'hunspell-pt-br']:
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:libreoffice/ppa']]
}
