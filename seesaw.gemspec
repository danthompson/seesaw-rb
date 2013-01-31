# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seesaw/version'

Gem::Specification.new do |gem|
  gem.name          = 'seesaw'
  gem.version       = Seesaw::VERSION
  gem.authors       = ['Sam Soffes', 'Aaron Gotwalt']
  gem.email         = ['sam@soff.es', 'gotwalt@gmail.com']
  gem.description   = 'Ruby gem for working with the Seesaw API.'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/seesawco/seesaw-rb'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.9.2'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'hashie', '~> 1.2.0'
end
