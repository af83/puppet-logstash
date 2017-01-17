# puppet-logstash

Module d'instanciation et de paramétrage de Logstash basé sur le
[module logstash distribué par Elastic](http://github.com/elastic/puppet-logstash)

## Configuration minimale

```
include logstash

logstash::configfile {
  content => 'input { stdin} output { null }'
}
```
