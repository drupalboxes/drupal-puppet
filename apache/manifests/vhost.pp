
define apache::vhost( $port, $docroot, $ssl=true, $template='apache/vhost/vhost.conf.erb', $priority, $serveraliases = '' , $enable=true) {

  #include apache
  #include apache::params

  file {"${apache::params::vhostdir}/${priority}-${name}.conf":
    content   => template($template),
    mode      => "${apache::params::configfile_mode}",
    owner     => "${apache::params::configfile_owner}",
    group     => "${apache::params::configfile_group}",
    require   => Class['apache::install'],
    notify    => Class['apache::service'],
  }
}