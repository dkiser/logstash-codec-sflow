Gem::Specification.new do |s|

  s.name            = 'logstash-codec-sflow'
  s.version         = '1.0.0'
  s.licenses        = ['MIT']
  s.summary         = "The sflow codec is for decoding sflow v5 flows."
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Domingo Kiser"]
  s.email           = 'domingo.kiser@gmail.com'
  s.homepage        = "http://github.com/dkiser/logstash-codec-sflow"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "codec" }

  # Gem dependencies
  s.add_runtime_dependency 'logstash', '>= 1.4.0', '< 2.0.0'
  s.add_runtime_dependency 'bindata', ['>= 1.5.0']
  s.add_runtime_dependency 'em-sflow', ['>= 1.0.3']
  s.add_development_dependency 'logstash-devutils'
end
