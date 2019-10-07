# frozen_string_literal: true

module GorillaPatch
	## Adding slice methods
	module Slice
		refine Hash do
			def slice(*keys, nils: false)
				return super if defined?(super) && !nils

				keys.each_with_object(self.class.new) do |k, hash|
					hash[k] = self[k] if nils || key?(k)
				end
			end

			def slice!(*keys, nils: false)
				omit = slice(*self.keys - keys, nils: nils)
				hash = slice(*keys, nils: nils)
				replace(hash)
				omit
			end

			def slice_reverse!(*keys, nils: false)
				omit = slice!(*keys, nils: nils)
				hash = dup
				replace(omit)
				hash
			end
		end
	end
end
