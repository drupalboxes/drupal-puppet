
class php::apc {
  php::extension { 'pecl-apc': }
  
  $enabled = 1
  $shm_size = "128M"
  
  file {
    "apc.ini":
      path      => "$php::params::php_dir/apc.ini",
      require   => Class["php::install"],
      notify    => Class["apache::service"],
      content   => template("php/apc.ini.erb")
  }
  
}