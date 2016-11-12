# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli_spinnable/version'

Gem::Specification.new do |spec|
  spec.name          = 'cli_spinnable'
  spec.version       = CliSpinnable::VERSION
  spec.authors       = ['Krzysztof Maicher']
  spec.email         = ['krzysztof.maicher@gmail.com']

  spec.summary       = 'CLI Spinner.'
  spec.description   = 'CLI Spinner.'
  spec.homepage      = 'https://github.com/maicher/cil_spinnable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rubocop', '~> 0.44'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'pry'
end
