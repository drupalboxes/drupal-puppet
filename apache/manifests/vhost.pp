
define apache::vhost( $port, $documentroot, $ssl = false, $template='apache/vhost.conf.erb', $priority = '1', $aliases = [] , $enable=true) {
  file {"${apache::params::vhostdir}/${priority}-${name}.conf":
    content   => template($template),
 #   mode      => "${apache::params::configfile_mode}",
 #   owner     => "${apache::params::configfile_owner}",
 #   group     => "${apache::params::configfile_group}",
    require   => Class['apache::install'],
    notify    => Class['apache::service'],
  }

}
