
class php::install {
  Package {
    ensure => present
  }

  package { 'php':
    name    => $php::params::package
  }
  
  package { 'php-common':
    name    => $php::params::package_common
  }
}

class php::config {
  $display_errors = $php::params::display_errors
  $upload_max_filesize = $php::params::upload_max_filesize
  $post_max_size = $php::params::post_max_size
  $extension_dir = $php::params::extension_dir

  file {
    'php.ini':
      path      => "${php::params::php_ini}",
      require   => Class['php::install'],
      notify    => Class['apache::service'],
      content   => template('php/php.ini.erb')
  }
}

class php {
  include php::params
  include php::install, php::config
}