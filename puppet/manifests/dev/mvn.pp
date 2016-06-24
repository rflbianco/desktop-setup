class ubuntudesktop::dev::mvn {
  include apt
  apt::ppa { 'ppa:andrei-pozolotin/maven3': }
  
  package { 'maven':
    ensure  => 'latest',
    require => [Apt::Ppa['ppa:andrei-pozolotin/maven3']]
  }
}