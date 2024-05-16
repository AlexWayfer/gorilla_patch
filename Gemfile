# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development do
	gem 'pry-byebug', '~> 3.9'

	gem 'bundler', '~> 2.0'
	gem 'gem_toys', '~> 0.14.0'
	gem 'toys', '~> 0.15.3'

	## For Inflections testing
	gem 'dry-inflector', '~> 1.0.0'
	gem 'sequel', '~> 5.0'
end

group :audit do
	gem 'bundler-audit', '~> 0.9.0'
end

group :test do
	gem 'rspec', '~> 3.9'
	gem 'simplecov', '~> 0.22.0'
	gem 'simplecov-cobertura', '~> 2.1'
end

group :lint do
	gem 'rubocop', '~> 1.63.5'
	gem 'rubocop-performance', '~> 1.0'
	gem 'rubocop-rspec', '~> 2.0'
	gem 'rubocop-sequel', '~> 0.3.1'
end
