require 'simplecov'
SimpleCov.start do
	add_filter '/spec/'
end
SimpleCov.start

require 'gorilla-patch'
