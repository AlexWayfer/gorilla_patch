# frozen_string_literal: true

module GorillaPatch
	## Adding namespaces-changing methods
	module Namespace
		refine String do
			def demodulize
				split('::').last
			end
		end

		[Module, Class].each do |klass|
			refine klass do
				def demodulize
					to_s.demodulize
				end
			end
		end
	end
end
