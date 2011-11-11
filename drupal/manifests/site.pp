#
# A Drupal site depends on a Drupal platform. The platform is a codebase which
# includes Drupal core plus any added extras (which may include modules in
# an install profile or sites/all/modules).
#

define drupal::site(
  $platform,
  $db_name,
  $db_user,
  $db_password,
  $db_host,
  $filepath,
  $conf = { },
  $files = absent,
  $modules = absent,
  $themes = absent,
  $libraries = absent,
  $url = null,
  $aliases = []
) {
  $base = $drupal::params::install_path
  $site = "${base}/${drupal::params::sites_dir}/${name}"
  $platform_path = "${base}/${drupal::params::platforms_dir}/${platform}"
  
  $primary_url = $url ? {
    null    => $name,
    default => $url
  }
  
  $site_link = "${platform_path}/sites/${primary_url}"
  
  file { "${name}_site_dir":
    ensure  => directory,
    path    => $site
  }

  file { "${name}_site_link":
    ensure  => link,
    path    => $site_link,
    target  => $site
  }
  
  drupal::site_alias { $aliases:
    platform  => $platform,
    site      => $name
  }

  file { "${name}_settings":
    ensure  => present,
    path    => "${site}/settings.php",
    content => template("drupal/settings.php.erb")
  }

  apache::vhost {$primary_url:
    documentroot => $platform_path,
    port         => 80
  }
}
