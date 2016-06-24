class ubuntudesktop::internet {
  ##########################################################
  # Internet Messengers
#  package { "pidgin": ensure => "installed" }

  ##########################################################
  # Browsers
  package { "chromium-browser": ensure => "installed" }

  include ubuntudesktop::internet::opera
}
