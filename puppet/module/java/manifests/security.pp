
class ubuntudesktop::security {

   package { 'keepassx': ensure => 'installed' }

   include ubuntudesktop::security::lastpass
}