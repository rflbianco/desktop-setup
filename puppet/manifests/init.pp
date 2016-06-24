# Class: ubuntudesktop
#
# This module manages ubuntudesktop
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefilejava
#
# Sample Usage:
#
class ubuntudesktop {

  include ubuntudesktop::tools
  include ubuntudesktop::network
  include ubuntudesktop::internet
  include ubuntudesktop::graphic
  include ubuntudesktop::media
  include ubuntudesktop::dev
  include ubuntudesktop::editors
  include ubuntudesktop::compiler
  include ubuntudesktop::virtualization
  include ubuntudesktop::security
  include ubuntudesktop::office

  include ubuntudesktop::desktop

  ubuntudesktop::sdk::java { 'java-7-oracle': 
    version         => '7'
  }

  ubuntudesktop::sdk::java { 'java-8-oracle':
    version         => '8',
    default_version => true
  }

  class { 'archive::prerequisites': } -> class { 'idea::community':
    version => '14.1.4'
  }

  include nodejs


  include software::editors::atom
  include software::editors::vim
  include software::social::skype
  include software::entertainment::vlc
  include software::browsers::chrome

  include dropbox
}
