##########################################################
# Chromium from official repository
package { "chromium-browser": ensure => "installed" }

##########################################################
# Chrome from edestecd/software module
include software::browsers::chrome

##########################################################
# Opera from Official DEB repository
apt::source { 'opera-ppa':
  location   => 'http://deb.opera.com/opera/',
  release    => 'stable',
  repos      => 'non-free'
}

apt::key { 'opera-ppa':
  id     => 'F6D61D45',
  source => 'http://deb.opera.com/archive.key'
}

package { 'opera-stable':
  ensure  => 'installed',
  require => [
    Apt::Source['opera-ppa'],
    Apt::Key['opera-ppa']
  ],
}
