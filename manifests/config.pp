class logstash::config {
  require logstash::package
  file { ['/etc/logstash/conf.d','/etc/logstash/patterns']:
    ensure  => directory,
    group   => 'logstash',
    owner   => 'logstash',
    purge   => true,
    recurse => true,
  }
}
