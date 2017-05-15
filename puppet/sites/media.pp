include apt

##########################################################
# MP3 id3 taggging
package { ['python-mutagen', 'python3-mutagen']: ensure => 'installed' }


##########################################################
# Audacious GTK+ audioplayer from PPA
apt::ppa { 'ppa:nilarimogard/webupd8': }
package { 'audacious':
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:nilarimogard/webupd8']],
}

##########################################################
# CMus CLI audioplayer from official repository
package { 'cmus': ensure => 'installed' }


##########################################################
# PuddleTag (Qt-based mp3tag application) from PPA
apt::ppa { 'ppa:webupd8team/puddletag': }
package { 'puddletag':
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:webupd8team/puddletag']],
}

##########################################################
# Spotify from Official DEB repository
apt::source { 'spotify-ppa':
  location   => 'http://repository.spotify.com/',
  release    => 'stable',
  repos      => 'non-free'
}

apt::key { 'spotify-ppa':
  server => 'keyserver.ubuntu.com',
  id     => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
}

package { 'spotify-client':
  ensure  => 'installed',
  require => [
    Apt::Source['spotify-ppa'],
    Apt::Key['spotify-ppa']
  ],
}
