module GorillaPatch
	## Adding keys methods
	module Keys
		refine Hash do
			def keys?(*keys)
				keys.all? { |k| key?(k) }
			end
		end
	end
end
