class ubuntudesktop::dev::gradle {
  include apt
  apt::ppa { 'ppa:cwchien/gradle': }
  
  package { 'gradle':
    ensure  => 'latest',
    require => [Apt::Ppa['ppa:cwchien/gradle']]
  }
}