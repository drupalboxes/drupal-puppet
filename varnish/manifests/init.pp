
class varnish::install {
  repos::yum { 'varnish':
    enabled         => 1,
    descr           => 'Varnish 3.0 for Enterprise Linux 5 - $basearch',
    gpgcheck        => 0,
    baseurl         => 'http://repo.varnish-cache.org/redhat/varnish-3.0/el5/$basearch',
    priority        => 1,
    reponame        => 'varnish-3.0'
  }
  
  package { 'varnish':
    name    => $varnish::params::package,
    ensure  => $varnish::params::version,
    require => Repos::Yum['varnish']
  }
}

class varnish::service {
  service { 'varnish':
    ensure      => running,
    name => $varnish::params::service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['varnish::install'],
  }
}

class varnish::config {
  $backend_host       = $varnish::params::backend_host
  $backend_port       = $varnish::params::backend_port
  $default_vcl        = $varnish::params::default_vcl
  $listen_port        = $varnish::params::listen_port
  $admin_listen_port  = $varnish::params::admin_listen_port
  $purge_ips          = $varnish::params::purge_ips

  file {
    'varnish/default.vcl':
      path      => $varnish::params::default_vcl,
      require   => Class['varnish::install'],
      notify    => Class['varnish::service'],
      content   => template('varnish/default.vcl.erb')
  }
  
  file {
    'varnish/sysconfig':
      path      => $varnish::params::sysconfig,
      require   => Class['varnish::install'],
      notify    => Class['varnish::service'],
      content   => template('varnish/sysconfig.erb')
  }
}


class varnish {
  include varnish::params
  include varnish::install, varnish::config, varnish::service
}