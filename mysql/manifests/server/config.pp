
class mysql::server::config {
  # here we're going to use Augeas to insert some stuff into the MySQL config
  
  augeas { "my.cnf/mysqld":
    context => "/files/etc/my.cnf/mysqld",
    load_path => "/usr/share/augeas/lenses/contrib/",
    changes => [
      "set pid-file /var/run/mysqld/mysqld.pid",
      "set old_passwords 0",
      "set character-set-server utf8",
      "set log-warnings 1",
    ],
  }

}