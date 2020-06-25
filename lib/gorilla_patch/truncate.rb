# frozen_string_literal: true

module GorillaPatch
	## Module for truncating
	module Truncate
		refine String do
			def truncate(position, separator: '', omission: '...')
				return dup if length <= position

				stop = position - omission.length
				stop = rindex(separator, stop) if separator.is_a?(Regexp) || !separator.empty?

				"#{self[0, stop]}#{omission}"
			end
		end
	end
end
