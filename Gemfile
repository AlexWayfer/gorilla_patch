# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development do
	gem 'pry-byebug', '~> 3.9'

	gem 'bundler', '~> 2.0'
	gem 'gem_toys', '~> 0.16.0'
	gem 'toys', '~> 0.17.0'

	## For Inflections testing
	gem 'dry-inflector', '~> 1.1.0'
	gem 'sequel', '~> 5.0'
end

group :audit do
	gem 'bundler-audit', '~> 0.9.0'
end

group :test do
	gem 'rspec', '~> 3.9'
	gem 'simplecov', '~> 0.22.0'
	gem 'simplecov-cobertura', '~> 3.0'
end

group :lint do
	gem 'rubocop', '~> 1.81.0'
	gem 'rubocop-performance', '~> 1.0'
	gem 'rubocop-rspec', '~> 3.3'
	gem 'rubocop-sequel', '~> 0.4.0'
end
