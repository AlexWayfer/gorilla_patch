# frozen_string_literal: true

require_relative 'lib/gorilla_patch/version'

Gem::Specification.new do |spec|
	spec.name          = 'gorilla_patch'
	spec.version       = GorillaPatch::VERSION
	spec.summary       = 'Refining core classes'
	spec.description   = 'Refine Ruby Core classes with methods like Active Support.'
	spec.authors       = ['Alexander Popov']
	spec.email         = 'alex.wayfer@gmail.com'
	spec.license       = 'MIT'

	source_code_uri = 'https://github.com/AlexWayfer/gorilla_patch'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/gorilla_patch/blob/main/CHANGELOG.md'

	spec.metadata['rubygems_mfa_required'] = 'true'

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.required_ruby_version = '>= 2.7', '< 4'

	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'gem_toys', '~> 0.12.1'
	spec.add_development_dependency 'toys', '~> 0.13.0'

	spec.add_development_dependency 'bundler-audit', '~> 0.9.0'

	spec.add_development_dependency 'codecov', '~> 0.6.0'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.21.0'

	spec.add_development_dependency 'rubocop', '~> 1.31.1'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
	spec.add_development_dependency 'rubocop-sequel', '~> 0.3.1'

	## For Inflections testing
	spec.add_development_dependency 'dry-inflector', '~> 0.3.0'
	spec.add_development_dependency 'sequel', '~> 5.0'
end
