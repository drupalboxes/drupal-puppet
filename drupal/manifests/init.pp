

class drupal::base {
  user { 'drupal':
    ensure  => present,
    comment => 'Drupal user',
    gid     => 'drupal',
    shell   => '/bin/false',
    require => Group['drupal'],
  }

  group { 'drupal':
    ensure => present,
  }

  File { 
    owner  => $drupal::params::file_owner,
    group  => $drupal::params::file_group
  }


  file { 'install_path':
    path   => $drupal::params::install_path,
    ensure => directory,
  }

  file { 'platforms':
    path   => "${drupal::params::install_path}/platforms",
    ensure => directory
  }

  file { 'platform_sources':
    path   => "${drupal::params::install_path}/platform_sources",
    ensure => directory
  }

  file { 'sites':
    path   => "${drupal::params::install_path}/sites",
    ensure => directory
  }
}

class drupal {
  include php
  
  include drupal::params, drupal::base
}