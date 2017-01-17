define logstash::configfile (
  $content = undef,
  $source  = undef)
  {

  $path = "/etc/logstash/conf.d/${name}"

  if($content){
    file { $path:
      content => $content,
      owner   => 'logstash',
      group   => 'logstash',
      mode    => '0440',
      require => Package['logstash'],
      tag     => [ 'logstash_config' ]
    }
  }
  elsif($source){
    file { $path:
      source  => $source,
      owner   => 'logstash',
      group   => 'logstash',
      mode    => '0440',
      require => Package['logstash'],
      tag     => [ 'logstash_config' ]
    }
  }
}
