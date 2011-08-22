
class mysql::server::install {
  package { "mysql-server":
    ensure   => "$mysql::params::server_version",
    name     => "$mysql::params::server_package"
  }
}

class mysql::server::service {
  service { "mysql-server":
    name        => "$mysql::params::service",
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["mysql::server::install"],
  }
}

class mysql::server::config {
  file {
    "my.cnf":
      path      => "$mysql::params::my_cnf",
      require   => Class["mysql::server::install"],
      notify    => Class["mysql::server::service"],
      content   => template("mysql/my.cnf.erb")
  }
}

class mysql::server {
  include mysql
  include mysql::server::install,
          mysql::server::service,
          mysql::server::config
}