
define drupal::platform( $type, $source ) {
  $owner = $drupal::params::file_owner
  $group = $drupal::params::file_group

  file { "platforms/$name":
    path   => "$drupal::params::install_path/platforms/$name",
    ensure => directory,
    owner  => $drupal::params::file_owner,
    group  => $drupal::params::file_group,
    recurse => true,
    ignore => "sites/*/files"
  }

  file { "platforms/sources/$name":
    path    => "$drupal::params::install_path/platform_sources/$name",
    source  => $source
  }

  exec { "extract-platform":
    command => "tar zxf $drupal::params::install_path/platform_sources/$name --overwrite --strip-components=1 && chown -R $owner:$group *",
    cwd     => "$drupal::params::install_path/platforms/$name",
    require => File["platforms/$name", "platforms/sources/$name"],
 #   creates => "$drupal::params::install_path/platforms/$name"
    path => ["/bin", "/sbin"],
  }

  file { "platforms/$name/sites/default":
    path   => "$drupal::params::install_path/platforms/$name/sites/default",
    ensure => absent,
    force  => true
  }
}
