
class solr::install {
  package {'tomcat-solr':
    ensure  => present,
    name    => $solr::params::package
  }
}