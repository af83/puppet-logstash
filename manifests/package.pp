class logstash::package($version = 'latest') {
  $repository_version = $version ? {
    'latest' => '2.3',
    default  => $version
  }

  include elasticsearch::apt
  elasticsearch::apt::sources_list { 'logstash':
    version => $repository_version
  }

  package { 'logstash':
    ensure  => present,
    require => [
      Package['java-runtime'],
      Elasticsearch::Apt::Sources_list['logstash']
    ]
  }

  include java::runtime

}
