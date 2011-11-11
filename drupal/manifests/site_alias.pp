define drupal::site_alias(
  $platform,
  $site
) {
  $base = $drupal::params::install_path
  $site_path = "${base}/${drupal::params::sites_dir}/${site}"
  $platform_path = "${base}/${drupal::params::platforms_dir}/${platform}"
  notice("Site path: ${site_path} platform path: ${platform_path}")
  file { $name:
    ensure => link,
    target => $site_path,
    path   => "${platform_path}/sites/${name}"
  }
}
