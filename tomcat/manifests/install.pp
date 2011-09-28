
class tomcat::install {
  package {'tomcat':
    ensure  => present,
    name    => $tomcat::params::package
  }
}