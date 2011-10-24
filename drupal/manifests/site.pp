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
  $base = ${drupal::params::install_path}
  $site = "${base}/${drupal::params::sites_dir}/${name}"
  $platform = "${base}/${drupal::params::platforms_dir}/${platform}"
  
  $primary_url = $url ? {
    null    => $name,
    default => $url
  }
  
  $site_link = "${platform}/sites/{$url}"
  $site_path = "${}
  
  file { "${name}_site_dir":
    ensure  => link,
    path    => $site_link,
    target  => $site
  }
  
  drupal::site_alias { $aliases:
    platform  => $platform,
    site      => $name
  }
}

define drupal::site_alias(
  $platform,
  $site
) {
  $base = ${drupal::params::install_path}
  $site = "${base}/${drupal::params::sites_dir}/${site}"
  $platform = "${base}/${drupal::params::platforms_dir}/${platform}"
  
  file { $name:
    ensure => link,
    target => $site,
    path   => "${platform}/sites/${name}"
  }
}