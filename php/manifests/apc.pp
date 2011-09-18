
class php::apc(
  $enabled  = 1,
  $shm_size = '128',
  $rfc1867  = 1
){

  php::extension { 'pecl-apc': }
  
  file {
    "apc.ini":
      path      => "${php::params::php_dir}/apc.ini",
      require   => Class['php::install'],
      notify    => Class['apache::service'],
      content   => template('php/apc.ini.erb')
  }
  
}