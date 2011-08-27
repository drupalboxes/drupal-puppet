
class mysql::config {
  # base configuration for MySQL
  $user   = $mysql::params::mysql_user
  $port   = $mysql::params::port
  $socket = $mysql::params::socket

  file {
    'mysql/my.cnf':
      path      => $mysql::params::my_cnf,
      content   => template('mysql/my.cnf.erb')
  }
}