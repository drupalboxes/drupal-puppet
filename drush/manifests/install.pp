
class drush::install {
  realize Repos::Yum['base/el/repos/drupalboxes']
  package { 'drush':
    ensure   => $drush::version,
    name     => $drush::package,
    require  => Repos::Yum['base/el/repos/drupalboxes']
  }
}