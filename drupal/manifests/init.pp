

class drupal::base {
  user { "drupal":
    ensure => present,
    comment => "Drupal user",
    gid => "drupal",
    shell => "/bin/false",
    require => Group["drupal"],
  }

  group { "drupal":
    ensure => present,
  }

  file { "install_path":
    path   => $drupal::params::install_path,
    ensure => directory,
    owner  => $drupal::params::file_owner,
    group  => $drupal::params::file_group
  }
}

class drupal {
  include php
  
  include drupal::params, drupal::base
}