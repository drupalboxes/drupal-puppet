
class varnish::params(
  $backend_host       = $ipaddress,
  $backend_port       = 8080,
  $listen_port        = 80,
  $admin_listen_port  = 6082,
  $default_vcl        = '/etc/varnish/default.vcl',
  $version            = present,
  $package            = 'varnish',
  $service            = 'varnish',
  $sysconfig          = '/etc/sysconfig/varnish',
  $purge_ips          = [ '127.0.0.1' ]
) {

}