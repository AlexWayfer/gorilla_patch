# frozen_string_literal: true

include :bundler, static: true

subtool_apply do
	include :exec, exit_on_nonzero_status: true, log_level: Logger::UNKNOWN unless include? :exec
end

require 'gem_toys'
expand GemToys::Template

alias_tool :g, :gem

template 'shell command' do
	on_expand do
		disable_argument_parsing
	end
end

tool :rspec do
	expand 'shell command'

	def run
		exec ['rspec', *args]
	end
end

alias_tool :spec, :rspec
alias_tool :test, :rspec

tool :rubocop do
	expand 'shell command'

	def run
		exec ['rubocop', *args]
	end
end
