
class yum::config {
  $proxy_user = $yum::params::proxy_user
  $proxy_pass = $yum::params::proxy_pass
  $proxy_host = $yum::params::proxy_host

  # conf file

  file {"/etc/yum.conf": 
    content   => template('yum/yum.conf.erb'),
  }

}
