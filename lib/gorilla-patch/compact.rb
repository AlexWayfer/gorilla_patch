module GorillaPatch
	## Adding compact methods
	module Compact
		refine Hash do
			def compact
				select { |_key, value| !value.nil? }
			end

			def compact!
				reject! { |_key, value| value.nil? }
			end
		end
	end
end
