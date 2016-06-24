define ubuntudesktop::sdk::java::oracle (
  $version         = 'UNSET',
  $default_version = false,
) {
  $version_real = $version ? {
    'UNSET' => '8',
    default => $version,
  }

  $default_version_real = $default_version ? {
    'UNSET' => false,
    default => $default_version
  }

  $setdefault_package_name = "oracle-java${version_real}-set-default"

  include apt
  if ! defined(Apt::Ppa['ppa:webupd8team/java']) {
    apt::ppa { 'ppa:webupd8team/java': }
  }

  if ! defined(Exec['oracle-user-license-accepted']) {
    exec { 'oracle-user-license-accepted':
      command => 'echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections'
    }
  }

  package { "oracle-java${version_real}-installer":
    ensure => 'installed',
    require => [
      Apt::Ppa['ppa:webupd8team/java'],
      Exec['oracle-user-license-accepted']
    ]
  }

  if $default_version == true {
    if ! defined(Package[$setdefault_package_name]) {
      package { $setdefault_package_name:
        ensure => 'installed',
        require => [Package["oracle-java${version_real}-installer"]]
      }
    } 
  } else {
    if defined(Package[$setdefault_package_name]) {
      package { $setdefault_package_name:
        ensure => 'purged'
      }
    }
  }
}