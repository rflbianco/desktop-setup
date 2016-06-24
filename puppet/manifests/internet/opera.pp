class ubuntudesktop::internet::opera {
  apt::source { 'opera-ppa':
    location   => 'http://deb.opera.com/opera/',
    release    => 'stable',
    repos      => 'non-free'
  }

  apt::key { 'opera-ppa':
    id     => 'F6D61D45',
    source => 'http://deb.opera.com/archive.key'
  }

  package { 'opera':
    ensure  => 'installed',
    require => [
      Apt::Source['opera-ppa'],
      Apt::Key['opera-ppa']
    ],
  }
}