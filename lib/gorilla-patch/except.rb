module GorillaPatch
	## Adding except methods
	module Except
		refine Hash do
			def except(*keys)
				dup.except!(*keys)
			end

			def except!(*keys)
				keys.each { |key| delete(key) }
				self
			end
		end
	end
end
