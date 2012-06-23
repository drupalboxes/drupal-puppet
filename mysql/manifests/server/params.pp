
class mysql::server::params(
  $mysqld_root_password = 'password',  

  $mysqld_key_buffer_size          = '8M',
  $mysqld_max_allowed_packet       = '8M',
  $mysqld_table_open_cache         = '1024',
  $mysqld_sort_buffer_size         = '2M',
  $mysqld_net_buffer_length        = '16K',
  $mysqld_read_buffer_size         = '128K',
  $mysqld_read_rnd_buffer_size     = '256K',
  $mysqld_myisam_sort_buffer_size  = '8M',
  $mysqld_max_connections          = '256',
  $mysqld_default_storage_engine   = 'innodb',
  $mysqld_binlog_format            = 'row',
  $mysqld_server_id                = '1',
  
  $mysqld_innodb_buffer_pool_size        = '16M',
  $mysqld_innodb_flush_log_at_trx_commit = '2',
  $mysqld_innodb_flush_method            = 'O_DIRECT',
  $mysqld_innodb_thread_concurrency      = '8',
  $mysqld_innodb_log_file_size           = '5M',
  $mysqld_innodb_log_buffer_size         = '8M',
  $mysqld_innodb_file_per_table          = present,
  
  $mysqldump_quick              = present,
  $mysqldump_max_allowed_packet = '8M',
  
  $myisamchk_key_buffer_size  = '8M',
  $myisamchk_sort_buffer_size = '2M',
  $myisamchk_read_buffer      = '2M',
  $myisamchk_write_buffer     = '2M'
) {

}