
class apache::params::default {
  $version = present
  
  $package = $operatingsystem ? {
    debian    => 'apache2',
    ubuntu    => 'apache2',
    default   => 'httpd'
  }
  
  $service = $operatingsystem ? {
    debian    => 'apache2',
    ubuntu    => 'apache2',
    default   => 'httpd'
  }
  
  $httpd_conf = $operatingsystem ? {
    default   => '/etc/httpd/conf/httpd.conf'
  }
  
  $vhostdir = $operatingsystem ? {
    default   => '/etc/httpd/conf.d'
  }
  
  $timeout = 120
  $keepalive = 'On'
  $port = 80
  $serversignature = 'Off'
}