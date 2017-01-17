# Install and configure Logstash
class logstash(
  $version = 'latest'
)
{

  class { 'logstash::package':
    version => $version
  }
  include logstash::config
  include logstash::service
}
