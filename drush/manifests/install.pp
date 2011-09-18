
class drush::install {
  realize Repos::Yum['drupalboxes']
  package { 'drush':
    ensure   => $drush::version,
    name     => $drush::package,
    require  => Repos::Yum['drupalboxes']
  }
}