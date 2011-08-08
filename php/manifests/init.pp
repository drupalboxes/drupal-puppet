
class php::install {
  Package {
    ensure => present
  }

  package { 'php':
    name    => "$php::params::package"
  }
  
  package { 'php-common':
    name    => "$php::params::package_common"
  }
}

class php::config {
  file {
    "php.ini":
      path      => "$php::params::php_ini",
      require   => Class["php::install"],
      notify    => Class["apache::service"],
      content   => template("php/php.ini.erb")
  }
}

class php {
  include php::install, php::config
}