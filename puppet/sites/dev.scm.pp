Exec { path => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin' ] }

include apt

##########################################################
# Git and Tig from PPA
apt::ppa { 'ppa:git-core/ppa': }
package { ['git', 'git-extras']:
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:git-core/ppa']]
}

apt::ppa { 'ppa:aguignard/ppa': }
package { 'tig':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:aguignard/ppa']]
}


exec { 'git-lfs-apt-source':
  command => 'curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash',
  require => [Package['git']]
}
package { 'git-lfs':
  ensure  => installed,
  require => [Exec['git-lfs-apt-source']]
}


##########################################################
# SVN from official repository and Rabbitvcs from PPA
package { 'subversion':
  ensure  => 'latest'
}

apt::ppa { 'ppa:rabbitvcs/ppa': }
package { ['rabbitvcs-core', 'rabbitvcs-cli']:
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:rabbitvcs/ppa']]
}
