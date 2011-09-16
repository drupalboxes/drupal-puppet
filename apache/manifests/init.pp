

class apache::install {
  package { 'apache':
    ensure   => $apache::params::version,
    name     => $apache::params::package
  }
}

class apache::service {
  service { 'apache':
    ensure      => running,
    name        => $apache::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['apache::install'],
  }
}

class apache::config {
  file {
    'apache/httpd.conf':
      path      => $apache::params::httpd_conf,
      require   => Class['apache::install'],
      notify    => Class['apache::service'],
      content   => template('apache/httpd.conf.erb')
  }
}

class apache {
  include apache::params
  include apache::install, apache::service, apache::config
}