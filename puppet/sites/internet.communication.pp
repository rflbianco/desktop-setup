
# Internet Messengers
package { "pidgin": ensure => "installed" }


# CLI xmpp/jabber client
package { 'profanity': ensure => 'installed' }


##########################################################
# Skype
exec { 'partner-repository-skype':
  command => 'sed -i "s,\# deb \(.*\) partner,deb \1 partner," /etc/apt/sources.list && apt update',
  path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin'
}
package { 'skype':
  ensure  => "installed",
  require => [Exec['partner-repository-skype']]
}



##########################################################
# Sky - Skype for Business and Lync client
apt::source { 'sky-ppa':
  location   => 'https://tel.red/repos/ubuntu',
  release    => 'xenial',
  repos      => 'non-free'
}

apt::key { 'sky-ppa':
  server => 'keyserver.ubuntu.com',
  id     => '9454C19A66B920C83DDF696E07C8CCAFCE49F8C5'
}

package { 'sky':
  ensure  => 'installed',
  require => [
    Apt::Source['sky-ppa'],
    Apt::Key['sky-ppa']
  ],
}

##########################################################
# Softphone
# Disabled in favor of Linphone that provides a CLI option
# package { "ekiga": ensure => "installed" }

# Default Softphone because provides a CLI (linphonec)
package { "linphone": ensure => "installed" }
