
class tomcat::service {
  service { 'tomcat':
    ensure      => running,
    name        => $tomcat::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['tomcat::install'],
  }
}