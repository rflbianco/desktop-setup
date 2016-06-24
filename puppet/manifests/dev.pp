class ubuntudesktop::dev {
  include ubuntudesktop::dev::gradle
  include ubuntudesktop::dev::mvn

  include ubuntudesktop::dev::git
  include ubuntudesktop::dev::svn
  include ubuntudesktop::dev::rabbitvcs
}