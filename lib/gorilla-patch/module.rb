require_relative './string'

module GorillaPatch
	## Refine Module class
	module ModuleExt
		refine Module do
			using StringExt

			def demodulize
				to_s.demodulize
			end

			def underscore
				to_s.underscore
			end
		end
	end
end
