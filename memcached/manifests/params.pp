
class memcached::params(
  $package    = 'memcached',
  $service    = 'memcached',
  $cachesize  = 128,
  $port       = 11211,
  $maxconn    = 1024,
  $options    = '',
  $version    = present,
  $sysconfig  = '/etc/sysconfig/memcached'
) {

}