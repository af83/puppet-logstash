define logstash::patternfile (
  $content = undef,
  $source  = undef)
  {

  require logstash::config

  $path = "/etc/logstash/patterns/${name}"

  if($content){
    file { $path:
      content => $content,
      owner   => 'logstash',
      group   => 'logstash',
      mode    => '0644',
      tag     => ['logstash_config']
    }
  }
  elsif($source){
    file { $path:
      source  => $source,
      owner   => 'logstash',
      group   => 'logstash',
      mode    => '0644',
      tag     => ['logstash_config']
    }
  }
}
