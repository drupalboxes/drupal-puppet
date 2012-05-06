
class pear::install {
  package { 'php-pear':
    ensure => present,
    name   => $pear::params::package
  }
}
