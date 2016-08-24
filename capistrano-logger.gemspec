# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-logger'
  spec.version       = Capistrano::Logger::VERSION
  spec.authors       = ['Alexander Shlinchak']
  spec.email         = ['ashlinchak@gmail.com']
  spec.summary       = 'Show logs via capistrano.'
  spec.description   = 'Show your logs with capistrano.'
  spec.homepage      = 'https://github.com/ashlinchak/capistrano-logger'
  spec.licenses      = ['MIT']

  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0', '< 4.0.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
end
