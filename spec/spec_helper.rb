require 'simplecov'
SimpleCov.start

if ENV['CODECOV']
	require 'codecov'
	SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'gorilla-patch'
