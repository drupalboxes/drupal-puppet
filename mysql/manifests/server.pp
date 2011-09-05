
class mysql::server {
  include mysql
  include mysql::server::params,
          mysql::server::install,
          mysql::server::service,
          mysql::server::config
}