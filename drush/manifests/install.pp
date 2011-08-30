
class drush::install {
  package { 'drush':
    ensure   => $drush::version,
    name     => $drush::package
  }
}