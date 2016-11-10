module GorillaPatch
	## Adding include methods
	module Include
		refine Range do
			def include?(value)
				return super unless value.is_a? Range
				super(value.first) && super(value.last)
			end
		end
	end
end
