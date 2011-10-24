
define drupal::platform(
  $package => $name
) {
  package {'drupal-platform-${name}':
    ensure  => present,
    name    => $package
  }
}
