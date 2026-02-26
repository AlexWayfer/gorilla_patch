# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development do
	gem 'pry-byebug', '~> 3.9'

	gem 'gem_toys', '~> 1.0'
	gem 'toys', '~> 0.19.1'

	## For Inflections testing
	gem 'dry-inflector', '~> 1.3.1'
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
	gem 'rubocop', '~> 1.85.0'
	gem 'rubocop-performance', '~> 1.0'
	gem 'rubocop-rspec', '~> 3.3'
	gem 'rubocop-sequel', '~> 0.4.0'
end
