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
