
class base::el::config {
  $proxy_user = $base::el::params::proxy_user
  $proxy_pass = $base::el::params::proxy_pass
  $proxy_host = $base::el::params::proxy_host

  # conf file

  file {"/etc/environment": 
    content   => template('base/el/environment.erb'),
  }

}
