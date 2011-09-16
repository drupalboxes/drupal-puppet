
class base::el::repos::ius {
  @repos::yum { "base/el/repos/ius":
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