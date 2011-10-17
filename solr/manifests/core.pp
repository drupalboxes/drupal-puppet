
define solr::core(
  $schema     = 'puppet:///modules/solr/files/schema.xml',
  $solrconfig = 'puppet:///modules/solr/files/solrconfig.xml'
) {

  $core_path = "${solr::params::solr_root}/cores/core_{$name}"

  File {
    owner     => $tomcat::params::user,
    group     => $tomcat::params::group
  }

  file { $core_path:
    ensure => directory
  }
  
  file { "$core_path/data":
    ensure => directory
  }
  
  file { "$core_path/data/index":
    ensure => directory
  }
  
  # @todo ensure index files exist?
}