
class augeas::install {

  package { $augeas::params::package:
    ensure => $augeas::params::version
  }
 
  package { $augeas::params::libs:
    ensure => $augeas::params::version
  }
 
  package { $augeas::params::ruby:
    ensure => present
  }

}