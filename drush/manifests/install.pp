
class drush::install {
  realize Repos::Yum['drupalboxes']
  pear::package {'Console_Table': }
  package { 'drush':
    ensure   => $drush::version,
    name     => $drush::package,
    require  => [Repos::Yum['drupalboxes'], Pear::Package['Console_Table']]
  }
}