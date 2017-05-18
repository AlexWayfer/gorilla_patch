# frozen_string_literal: true

module GorillaPatch
	## Adding slice methods
	module Slice
		refine Hash do
			def slice(*keys)
				keys.each_with_object({}) { |k, hash| hash[k] = self[k] if key?(k) }
			end

			def slice!(*keys)
				omit = slice(*self.keys - keys)
				hash = slice(*keys)
				replace(hash)
				omit
			end

			def slice_reverse!(*keys)
				omit = slice!(*keys)
				hash = dup
				replace(omit)
				hash
			end
		end
	end
end
