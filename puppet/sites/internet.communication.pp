
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
# Softphone
# Disabled in favor of Linphone that provides a CLI option
# package { "ekiga": ensure => "installed" }

# Default Softphone because provides a CLI (linphonec)
package { "linphone": ensure => "installed" }
