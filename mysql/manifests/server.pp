
class mysql::server::install {
  package { 'mysql-server':
    ensure   => $mysql::params::server_version,
    name     => $mysql::params::server_package
  }
}

class mysql::server::service {
  service { 'mysql-server':
    name        => $mysql::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['mysql::server::install'],
  }
}

class mysql::server {
  include mysql
  include mysql::server::install,
          mysql::server::service,
          mysql::server::config
}