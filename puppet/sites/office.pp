include apt

apt::ppa { 'ppa:libreoffice/ppa': }
package { ['libreoffice', 'libreoffice-style-sifr']:
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:libreoffice/ppa']]
}
