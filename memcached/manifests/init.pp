
class memcached::install {
  package { 'memcached':
    ensure   => $memcached::params::version,
    name     => $memcached::params::package
  }
}

class memcached::service {
  service { 'memcached':
    ensure      => running,
    name        => $memcached::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['memcached::install'],
  }
}

class memcached::config {
  $port       = $memcached::params::port
  $maxconn    = $memcached::params::maxconn
  $cachesize  = $memcached::params::cachesize
  $options    = $memcached::params::options

  file {
    'memcached/sysconfig':
      path      => $memcached::params::sysconfig,
      require   => Class['memcached::install'],
      notify    => Class['memcached::service'],
      content   => template('memcached/sysconfig.erb')
  }
}

class memcached {
  include memcached::params
  include memcached::install, memcached::config, memcached::service
}