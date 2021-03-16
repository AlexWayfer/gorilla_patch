# frozen_string_literal: true

module GorillaPatch
	## Adding except methods
	module Except
		refine Hash do
			if RUBY_VERSION < '3.0'
				def except(*keys)
					dup.except!(*keys)
				end
			end

			def except!(*keys)
				keys.each { |key| delete(key) }
				self
			end
		end
	end
end
