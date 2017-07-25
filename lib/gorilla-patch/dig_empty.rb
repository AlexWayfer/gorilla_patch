module GorillaPatch
	## Allows dig with 0 arguments
	module DigEmpty
		refine Hash do
			def dig(*keys)
				keys.any? ? super : self
			end
		end
	end
end
