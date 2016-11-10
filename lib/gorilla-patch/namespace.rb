module GorillaPatch
	## Adding namespaces-changing methods
	module Namespace
		refine String do
			def demodulize
				split('::').last
			end
		end

		refine Module do
			def demodulize
				to_s.demodulize
			end
		end
	end
end
