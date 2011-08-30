
class mysql::server::service {
  service { 'mysql-server':
    name        => $mysql::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['mysql::server::install'],
  }
}
