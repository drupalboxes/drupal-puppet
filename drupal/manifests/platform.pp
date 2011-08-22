
define drupal::platform( $type, $source ) {
  file { "platforms/$name":
    path   => "$drupal::params::install_path/platforms/$name",
    ensure => directory,
    owner  => $drupal::params::file_owner,
    group  => $drupal::params::file_group
  }

  file { "platforms/sources/$name":
    path    => "$drupal::params::install_path/platform_sources/$name",
    source  => $source
  }

  exec { "extract-platform":
    command => "tar zxf $drupal::params::install_path/platform_sources/$name",
    cwd     => "$drupal::params::install_path/platforms/$name",
 #   creates => "$drupal::params::install_path/platforms/$name"
    path => ["/bin", "/sbin"]
  }

}