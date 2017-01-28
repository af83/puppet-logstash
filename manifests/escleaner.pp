class logstash::escleaner(
  $retention = 2
)
{
  file { '/usr/local/bin/logstash-delete-index':
    require => [Package['logstash'], Package['libjson-perl']]
    source  => 'puppet:///modules/logstash/logstash-delete-index',
    owner   => root,
    group   => logstash,
    mode    => '0754'
  }

  package { 'libjson-perl': }

  cron { 'clean-logstash-indexes':
    command => "/usr/local/bin/logstash-delete-index -d ${retention} -r",
    user    => root,
    hour    => 2,
    minute  => 10,
    require => File['/usr/local/bin/logstash-delete-index'],
  }
}
