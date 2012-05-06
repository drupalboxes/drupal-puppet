define pear::package(
  $package = $title,
  $repository = "pear.php.net",
  $version = "latest"
) {
  if $version != "latest" {
    $pear_source = "${repository}/${package}-${version}"
  } else {
    $pear_source = "${repository}/${package}"
  }
  notice("${pear_source}")
  package { "pear-${repository}-${package}":
    name => $package,
    provider => "pear",
    source => $pear_source,
    ensure => $version,
    require => Class["pear"],
  }
}
