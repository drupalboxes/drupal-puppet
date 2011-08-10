
class apache::params(
  $version           = $apache::params::default::version,
  $package           = $apache::params::default::package,
  $service           = $apache::params::default::service,
  $httpd_conf        = $apache::params::default::httpd_conf,
  $timeout           = $apache::params::default::timeout,
  $keepalive         = $apache::params::default::keepalive,
  $port              = $apache::params::default::port,
  $serversignature   = $apache::params::default::serversignature,
  $vhostdir          = $apache::params::default::vhostdir
) inherits apache::params::default {

}