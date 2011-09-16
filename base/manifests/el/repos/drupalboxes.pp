
class base::el::repos::drupalboxes {
  @repos::yum { 'base/el/repos/drupalboxes':
    enabled         => 1,
    descr           => 'Drupalboxes Repo',
    gpgcheck        => 0,
    baseurl         => 'http://yum.drupalbox.es/repo/centos/6/',
    priority        => 1,
    reponame        => 'drupalboxes'
  }
}