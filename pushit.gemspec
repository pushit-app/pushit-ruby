# coding: utf-8
require File.expand_path('../lib/pushit/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name                   = 'pushit-ruby'
  spec.version                = Pushit::VERSION
  spec.authors                = ['Rémi Delhaye']
  spec.email                  = ['contact@rdlh.io']
  spec.summary                = 'A simple ruby client for Pushit App'
  spec.description            = 'A simple ruby client for Pushit App'
  spec.homepage               = 'https://github.com/pushit-app/pushit-ruby'
  spec.license                = 'MIT'
  spec.required_ruby_version  = '~> 2.0'

  spec.files                  = `git ls-files -z`.split("\x0")
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths          = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'httpclient', '~> 2.3', '>= 2.3.1'
  spec.add_runtime_dependency 'multi_json', '~> 1.0'
end
