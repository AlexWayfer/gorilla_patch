# frozen_string_literal: true

module GorillaPatch
	## Adding slice methods
	module Slice
		refine Hash do
			def slice(*keys)
				return super if defined? super
				keys.each_with_object(self.class.new) do |k, hash|
					hash[k] = self[k] if key?(k)
				end
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
