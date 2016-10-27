# unibet/vagrant module
# include vagrant

# danzilio/virtualbox module
# include virtualbox

include apt

apt::ppa { 'ppa:costamagnagianfranco/virtualbox-ppa': }
package { ['virtualbox', 'virtualbox-ext-pack']:
  ensure => "installed",
  require => [Apt::Ppa['ppa:costamagnagianfranco/virtualbox-ppa']]
}
