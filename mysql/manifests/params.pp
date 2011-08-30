
class mysql::params(
  $client_version = present,
  $client_package = 'mysql',
  $server_version = present,
  $server_package = 'mysql-server',
  $service        = 'mysqld',
  $my_cnf         = '/etc/my.cnf',
  $mysql_user     = 'mysql',
  $port           = '3306',
  $socket         = '/var/lib/mysql/mysql.sock'
) {

}