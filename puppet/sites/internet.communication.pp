# Internet Messengers
package { "pidgin": ensure => "installed" }

exec { 'partner-repository-skype':
  command => 'sed -i "s,\# deb \(.*\) partner,deb \1 partner," /etc/apt/sources.list && apt update',
  path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin'
}
package { 'skype':
  ensure  => "installed",
  require => [Exec['partner-repository-skype']]
}

# Softphone
package { "ekiga": ensure => "installed" }
