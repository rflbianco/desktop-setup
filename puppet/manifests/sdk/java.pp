define ubuntudesktop::sdk::java (
  $version         = 'UNSET',
  $vendor          = 'UNSET',
  $default_version = false
) {
  $vendor_real = $vendor ? {
    'UNSET' => 'oracle',
    default => $vendor
  }

  case $vendor_real {
    'oracle': {
      ubuntudesktop::sdk::java::oracle { $title:
        version         => $version,
        default_version => $default_version
      }
    }
    'openjdk': {
      ubuntudesktop::sdk::java::openjdk { $title:
        version         => $version,
        default_version => $default_version
      }
    }
  }
}
