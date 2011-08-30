
class mysql::server::install {
  package { 'mysql-server':
    ensure   => $mysql::params::server_version,
    name     => $mysql::params::server_package
  }
}