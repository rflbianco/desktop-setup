define ubuntudesktop::compiler::thrift (
  $prefix  = '/usr',
  $version = '0.9.2',
  $default = false
) {
  $bin_name          = "thrift-${version}"
  $onlyif            = "test ! -f \"\$(which ${bin_name})\""
  $installer_path    = "/tmp/thrift-${version}"
  $installation_path = "/opt/thrift/${version}"

  if ! defined(Exec['thrift-deps']) {
    exec{ 'thrift-deps':
      command => 'sudo apt-get install -y libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev',
      onlyif  => $onlyif
    }
  }

  exec{ "download-thrift-${version}":
    command => "wget http://archive.apache.org/dist/thrift/${version}/thrift-${version}.tar.gz && tar -zxf thrift-${version}.tar.gz",
    cwd     => '/tmp',
    creates => $installer_path,
    onlyif  => $onlyif,
    require => [Exec['thrift-deps']]
  }

  exec{ "configure-thrift-${version}":
    command => "${installer_path}/configure --prefix=${prefix} --program-suffix=-${version}",
    cwd     => $installer_path,
    onlyif  => $onlyif,
    require => [Exec["download-thrift-${version}"]]
  }

  exec{ "make-thrift-${version}":
    command => "make",
    cwd     => $installer_path,
    onlyif  => $onlyif,
    require => [Exec["configure-thrift-${version}"]]
  }

  exec{ "install-thrift-${version}":
    command => "make install",
    cwd     => $installer_path,
    onlyif  => $onlyif,
    require => [Exec["make-thrift-${version}"]]
  }

  if $default {
    exec{ "set-thrift-default-${version}":
      command => "ln -s \"\$(which ${bin_name})\" thrift",
      cwd     => "${prefix}/bin",
      creates => "${prefix}/bin/thrift",
      require => [Exec["install-thrift-${version}"]]
    }
  }
}