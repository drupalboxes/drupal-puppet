
class mysql::server::config {
  include augeas
  
  augeas::lens { 'mysql.aug':
    source => 'mysql/mysql.aug'
  }
  
  augeas { "my.cnf/mysqld":
    context => "/files/etc/my.cnf/mysqld",
    #load_path => "/usr/share/augeas/lenses/contrib/",
    changes => [
      "set pid-file /var/run/mysqld/mysqld.pid",
      "set old_passwords 0",
      "set character-set-server utf8",
      "set log-warnings 1",
    ],
    require => [
      Class['augeas::config'],
      Augeas::Lens['mysql.aug'],
      Class["mysql::config"]
    ]
  }
}