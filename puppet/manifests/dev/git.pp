class ubuntudesktop::dev::git {

  include apt

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
}
