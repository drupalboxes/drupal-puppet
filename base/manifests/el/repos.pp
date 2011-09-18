
class base::el::repos {
  @repos::yum { 'drupalboxes':
    enabled         => 1,
    descr           => 'Drupalboxes Repo',
    gpgcheck        => 0,
    baseurl         => 'http://yum.drupalbox.es/repo/centos/6/',
    priority        => 1,
    reponame        => 'drupalboxes'
  }
  
  @repos::yum { 'epel':
    enabled         => 1,
    failovermethod  => 'priority',
    gpgcheck        => 1,
    gpgkey_path     => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    gpgkey_source   => 'puppet:///modules/base/el/IUS-COMMUNITY-GPG-KEY',
    descr           => 'Extra Packages for Enterprise Linux 5 - $basearch',
    baseurl         => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
    priority        => 10,
    reponame        => 'epel'
  }
  
  @repos::yum { 'ius':
    enabled         => 1,
    descr           => 'IUS Community Project Repo',
    gpgkey_path     => '/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    gpgcheck        => 1,
    baseurl         => 'http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/$basearch/',
    priority        => 1,
    gpgkey_source   => 'puppet:///modules/base/el/IUS-COMMUNITY-GPG-KEY',
    reponame        => 'ius'
  }
}