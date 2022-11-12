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

	github_uri = "https://github.com/AlexWayfer/#{spec.name}"

	spec.homepage = github_uri

	spec.metadata = {
		'bug_tracker_uri' => "#{github_uri}/issues",
		'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
		'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
		'homepage_uri' => spec.homepage,
		'rubygems_mfa_required' => 'true',
		'source_code_uri' => github_uri,
		'wiki_uri' => "#{github_uri}/wiki"
	}

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.required_ruby_version = '>= 3.0', '< 4'

	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'gem_toys', '~> 0.12.1'
	spec.add_development_dependency 'toys', '~> 0.14.2'

	spec.add_development_dependency 'bundler-audit', '~> 0.9.0'

	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.21.0'
	spec.add_development_dependency 'simplecov-cobertura', '~> 2.1'

	spec.add_development_dependency 'rubocop', '~> 1.37.1'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
	spec.add_development_dependency 'rubocop-sequel', '~> 0.3.1'

	## For Inflections testing
	spec.add_development_dependency 'dry-inflector', '~> 1.0.0'
	spec.add_development_dependency 'sequel', '~> 5.0'
end
