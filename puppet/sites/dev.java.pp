include apt

##########################################################
### Build tools
# Gradle from PPA
apt::ppa { 'ppa:cwchien/gradle': }
package { 'gradle':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:cwchien/gradle']]
}

# Maven from PPA
apt::ppa { 'ppa:andrei-pozolotin/maven3': }
package { 'maven':
  ensure  => 'latest',
  require => [Apt::Ppa['ppa:andrei-pozolotin/maven3']]
}
