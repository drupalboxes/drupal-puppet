
define augeas::lens($source) {
  file { "augeas/lens/${name}":
    ensure => present,
    path   => "${augeas::params::lenses}/${name}",
    source => $source,
    owner  => 'root',
    group  => 'root'
  }

}