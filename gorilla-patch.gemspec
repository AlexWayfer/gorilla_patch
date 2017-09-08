# frozen_string_literal: true

require 'date'

Gem::Specification.new do |s|
	s.name          = 'gorilla-patch'
	s.version       = '2.4.2'
	s.date          = Date.today.to_s
	s.summary       = 'Refining core classes'
	s.description   = 'Refine Ruby Core classes with methods like Active Support.'
	s.authors       = ['Alexander Popov']
	s.email         = 'alex.wayfer@gmail.com'
	s.files = Dir[File.join('lib', '**', '{*,.*}')]
	s.homepage      = 'https://github.com/AlexWayfer/gorilla-patch'
	s.license       = 'MIT'

	s.required_ruby_version = '>= 2.1.0'

	s.add_development_dependency 'rake', '~> 12'
	s.add_development_dependency 'rspec', '~> 3'
	s.add_development_dependency 'rubocop', '~> 0.49'
	s.add_development_dependency 'simplecov', '~> 0'
	s.add_development_dependency 'codecov', '~> 0'

	## For Inflections testing
	s.add_development_dependency 'sequel', '~> 5'
	s.add_development_dependency 'inflecto-refinements', '~> 0'
end
