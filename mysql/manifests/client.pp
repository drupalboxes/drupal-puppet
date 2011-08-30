

class mysql::client::install {
  package { 'mysql-client':
    name    => $mysql::params::client_package,
    ensure  => $mysql::params::client_version,
  }
}

class mysql::client {
  include mysql
  include mysql::client::install
}
