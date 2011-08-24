
class varnish::params(
  $backend_host = $ipaddress,
  $backend_port = 8080,
  $default_vcl  = "/etc/varnish/default.vcl",
  $version      = "present",
  $package      = "varnish",
  $service      = "varnish",
  $sysconfig    = "/etc/sysconfig/varnish"
) {

}