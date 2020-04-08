# frozen_string_literal: true

require 'date'
require_relative 'lib/gorilla_patch/version'

Gem::Specification.new do |s|
	s.name          = 'gorilla_patch'
	s.version       = GorillaPatch::VERSION
	s.date          = Date.today.to_s
	s.summary       = 'Refining core classes'
	s.description   = 'Refine Ruby Core classes with methods like Active Support.'
	s.authors       = ['Alexander Popov']
	s.email         = 'alex.wayfer@gmail.com'
	s.files = Dir[File.join('lib', '**', '{*,.*}')]
	s.homepage      = 'https://github.com/AlexWayfer/gorilla_patch'
	s.license       = 'MIT'

	s.required_ruby_version = '>= 2.4.0'

	s.add_development_dependency 'codecov', '~> 0.1.0'
	s.add_development_dependency 'pry-byebug', '~> 3.0'
	s.add_development_dependency 'rake', '~> 13.0'
	s.add_development_dependency 'rspec', '~> 3.0'
	s.add_development_dependency 'rubocop', '~> 0.81.0'
	s.add_development_dependency 'rubocop-performance', '~> 1.0'
	s.add_development_dependency 'rubocop-rspec', '~> 1.0'
	s.add_development_dependency 'simplecov', '~> 0.18.0'

	## For Inflections testing
	s.add_development_dependency 'dry-inflector', '~> 0.2.0'
	s.add_development_dependency 'sequel', '~> 5.0'
end
