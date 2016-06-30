include ::apt
apt::ppa { 'ppa:noobslab/icons': }
package { ['emerald-icon-theme', 'ultra-flat-icons', 'ultra-flat-icons-orange', 'flatwoken-icons', 'square-beam-icons', 'matrilineare', 'darkenza']:
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:noobslab/icons']]
}

apt::ppa { 'ppa:noobslab/icons2': }
package { ['sigma-metro-icons', 'square-icons']:
  ensure  => 'installed',
  require => [Apt::Ppa['ppa:noobslab/icons2']]
}

