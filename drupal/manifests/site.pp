
define drupal::site(
  $databases,
  $drupal_root,
  $conf = { },
  $url = null,
  $aliases = []
) {

  $primary_url = $url ? {
    null    => $name,
    default => $url
  }

  $site = "${drupal_root}/sites/${primary_url}"

  # needed due to Puppet bug: http://projects.puppetlabs.com/issues/9322
  Exec {
    path => "/bin:/sbin:/usr/bin:/usr/sbin"
  }

  exec { "${name}_drupal_root":
    command => "mkdir -p ${drupal_root}/sites",
    creates => "${drupal_root}/sites"
  }

  file { "${name}_site_dir":
    ensure  => directory,
    path    => $site,
    require => Exec["${name}_drupal_root"]
  }

  file { "${name}_site_files_dir":
    ensure  => directory,
    path    => "${site}/files",
    require => File["${name}_site_dir"]
    # todo: permissions
  }

  drupal::site_alias { $aliases:
    drupal_root => $drupal_root,
    site        => $primary_url,
    require     => File["${name}_site_dir"]
  }

  file { "${name}_settings":
    ensure  => present,
    path    => "${site}/settings.php",
    content => template("drupal/settings.php.erb"),
    require => File["${name}_site_dir"]
  }

  apache::vhost { $primary_url:
    documentroot => $drupal_root,
    port         => 80,
    aliases      => $aliases
  }

}
