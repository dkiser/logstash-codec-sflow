logstash-codec-sflow
====================

SFlow codec for Logstash.  Allows decoding of sflow packets directly via a Logstash input.

Uses the [em-sflow](https://github.com/normelton/em-sflow) sflow implementation for sflow parsing.

Information about SFlow can be found [here](http://www.sflow.org/about/index.php)

Logstash Configuration
====================

Setup an input port to receive sflow traffic using the 'sflow' codec.  Setup output plugin as you see fit.

    input {
      udp {
        port => 6343
        codec => sflow {}
      }
    }

    output {
    stdout {
        codec => rubydebug }
    }



Dependencies
====================

* em-sflow ruby library >= 1.0.3

Local Development
=======================

* Clone repo locally (some $REPOPATH)
* Install logstash (e.g. for osx)
  ```bash
  brew install logstash
  ```
* Setup jruby environment
   ```bash
   rvm install jruby
   ```
* Install em-sflow gem into elasticsearch
  ```bash
  cd $LSHOME
  env GEM_HOME=vendor/bundle/jruby/1.9 GEM_PATH="" java -jar vendor/jar/jruby-complete-1.7.11.jar -S gem install em-sflow
  ```

* Launch logstash with local test config and plugin path
  ```bash
  logstash --pluginpath $REPOPATH/lib -f logstash.conf --verbose
  ```
