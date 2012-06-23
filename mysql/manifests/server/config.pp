
class mysql::server::config {
  include augeas
  
  augeas::lens { 'mysql.aug':
    source => 'puppet:///modules/mysql/mysql.aug'
  }
  
  Augeas {
    require => [
      Class['augeas::config'],
      Augeas::Lens['mysql.aug'],
      Class['mysql::config']
    ]
  }
  
  augeas { 'my.cnf/mysqld':
    context => '/files/etc/my.cnf/mysqld',
    changes => [
      "set port ${mysql::params::port}",
      "set socket ${mysql::params::socket}",
      "set key_buffer_size ${mysql::server::params::mysqld_key_buffer_size}",
      "set max_allowed_packet ${mysql::server::params::mysqld_max_allowed_packet}",
      "set table_open_cache ${mysql::server::params::mysqld_table_open_cache}",
      "set sort_buffer_size ${mysql::server::params::mysqld_sort_buffer_size}",
      "set net_buffer_length ${mysql::server::params::mysqld_net_buffer_length}",
      "set read_buffer_size ${mysql::server::params::mysqld_read_buffer_size}",
      "set read_rnd_buffer_size ${mysql::server::params::mysqld_read_rnd_buffer_size}",
      "set myisam_sort_buffer_size ${mysql::server::params::mysqld_myisam_sort_buffer_size}",
      "set max_connections ${mysql::server::params::mysqld_max_connections}",
      "set default_storage_engine ${mysql::server::params::mysqld_default_storage_engine}",
#      "set binlog_format ${mysql::server::params::mysqld_binlog_format}",
      "set server_id ${mysql::server::params::mysqld_server_id}",
      "set innodb_buffer_pool_size ${mysql::server::params::mysqld_innodb_buffer_pool_size}",
      "set innodb_flush_log_at_trx_commit ${mysql::server::params::mysqld_innodb_flush_log_at_trx_commit}",
      "set innodb_flush_method ${mysql::server::params::mysqld_innodb_flush_method}",
      "set innodb_thread_concurrency ${mysql::server::params::mysqld_innodb_thread_concurrency}",
      "set innodb_log_file_size ${mysql::server::params::mysqld_innodb_log_file_size}",
      "set innodb_log_buffer_size ${mysql::server::params::mysqld_innodb_log_buffer_size}",
      "set innodb_file_per_table ${mysql::server::params::mysqld_innodb_file_per_table}",
      "set server_id ${mysql::server::params::mysqld_server_id}",
    ],
  }

  augeas { 'my.cnf/mysqldump':
    context => '/files/etc/my.cnf/mysqldump',
    changes => [
      "set max_allowed_packet ${mysql::server::params::mysqldump_max_allowed_packet}",
    ],
  }
  
  augeas { 'my.cnf/myisamchk':
    context => '/files/etc/my.cnf/myisamchk',
    changes => [
      "set key_buffer_size ${mysql::server::params::myisamchk_key_buffer_size}",
      "set sort_buffer_size ${mysql::server::params::myisamchk_sort_buffer_size}",
      "set read_buffer ${mysql::server::params::myisamchk_read_buffer}",
      "set write_buffer ${mysql::server::params::myisamchk_write_buffer}",
    ],
  }

  $pass = $mysql::server::params::mysqld_root_password

  if $pass == 'password' {
    warning('MySQL root password is set to the default password.')
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p${pass} status",
    path => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password ${pass}",
    require => Class['mysql::server::service']
  }
}
