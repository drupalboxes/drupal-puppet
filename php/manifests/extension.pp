
define php::extension {

  include php
  
  package { "php-${name}":
    name   => "${php::params::package}-${name}",
    ensure => present,
    notify => Class['apache::service']
  }

}