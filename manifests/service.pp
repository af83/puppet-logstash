class logstash::service {
  service { 'logstash':
    ensure  => running,
    require => Package['logstash'],
    restart => 'invoke-rc.d logstash reload',
    enable => true
  }

  File<| tag == 'logstash_config' |> ~> Service['logstash']
}
