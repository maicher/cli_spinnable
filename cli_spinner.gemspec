# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli_spinnable/version'

Gem::Specification.new do |spec|
  spec.name          = 'cli_spinnable'
  spec.version       = CliSpinnable::VERSION
  spec.authors       = ['Krzysztof Maicher']
  spec.email         = ['krzysztof.maicher@gmail.com']

  spec.summary       = 'CliSpinnable, a module that enriches ruby command line interface'
  spec.summary      += ' with rotating spinner, check mark (&#10003;) and and fail mark (&#215;).'
  spec.description   = 'CliSpinnable, a module that enriches ruby command line interface'
  spec.description  += ' with rotating spinner, check mark (&#10003;) and and fail mark (&#215;).'
  spec.homepage      = 'https://github.com/maicher/cli_spinnable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rubocop', '~> 0.44'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'pry', '~> 0.10'
end
