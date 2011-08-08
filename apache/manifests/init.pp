

class apache::install {
  package { "apache":
    ensure   => "$apache::params::version",
    name     => "$apache::params::package"
  }
}

class apache::service {
  service { "apache":
    name        => "$apache::params::service",
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["apache::install"],
  }
}

class apache::config {
  file {
    "httpd.conf":
      path      => "$apache::params::httpd_conf",
      require   => Class["apache::install"],
      notify    => Class["apache::service"],
      content   => template("apache/httpd.conf.erb")
  }
}

class apache {
#  class {'apache::params':
#    timeout => 60
#  }
  include apache::install, apache::service, apache::config
}