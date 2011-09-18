
define repos::yum(
  $baseurl = absent,
  $descr = absent,
  $enabled = 0,
  $exclude = absent,
  $failovermethod = absent,
  $gpgcheck = 0,
  $gpgkey_path = absent,
  $gpgkey_source = absent,
  $includepkgs = absent,
  $keepalive = 0,
  $mirrorlist = absent,
  $priority = 99,
  $proxy = absent,
  $proxy_password = absent,
  $proxy_username = absent,
  $reponame = ''
) {

  if $gpgkey != absent and $gpgkey_source != absent {
    file { "repos/yum/${name}/gpgkey":
      path    => $gpgkey_path,
      source  => $gpgkey_source,
      before  => Yumrepo["repos/yum/${name}"]
    }
  }
  
  yumrepo { "repos/yum/${name}":
    baseurl         => $baseurl,
    descr           => $descr,
    enabled         => $enabled,
    exclude         => $exclude,
    failovermethod  => $failovermethod,
    gpgcheck        => $gpgcheck,
    gpgkey          => $gpgkey_path ? { absent => absent, default => "file://${gpgkey_path}" },
    includepkgs     => $includepkgs,
    keepalive       => $keepalive,
    mirrorlist      => $mirrorlist,
    priority        => $priority,
    proxy           => $proxy,
    proxy_password  => $proxy_password,
    proxy_username  => $proxy_username,
    name            => $reponame
  }
  
}