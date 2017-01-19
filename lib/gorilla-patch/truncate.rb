module GorillaPatch
	## Module for truncating
	module Truncate
		refine String do
			def truncate(position, separator: '', omission: '...')
				return dup if length <= position
				stop = position - omission.length
				if separator.is_a?(Regexp) || !separator.empty?
					stop = rindex(separator, stop)
				end
				"#{self[0, stop]}#{omission}"
			end
		end
	end
end
