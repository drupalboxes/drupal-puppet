define drupal::site_alias(
  $drupal_root,
  $site
) {

  $target = "${drupal_root}/sites/${site}"
  $link = "${drupal_root}/sites/${name}"

  file { $name:
    ensure => link,
    target => $target,
    path   => $link
  }
}
