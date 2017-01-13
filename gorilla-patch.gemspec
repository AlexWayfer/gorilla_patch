# frozen_string_literal: true
Gem::Specification.new do |s|
	s.name          = 'gorilla-patch'
	s.version       = '2.0.0'
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
	s.add_development_dependency 'rubocop', '~> 0'
	s.add_development_dependency 'simplecov', '~> 0'
	s.add_development_dependency 'codeclimate-test-reporter', '~> 1'

	## For Inflections testing
	s.add_development_dependency 'sequel', '~> 4'
	s.add_development_dependency 'inflecto-refinements', '~> 0'
end
