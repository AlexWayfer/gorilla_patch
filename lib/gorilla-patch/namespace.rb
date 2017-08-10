# frozen_string_literal: true

module GorillaPatch
	## Adding namespaces-changing methods
	module Namespace
		refine String do
			def demodulize
				split('::').last.to_s
			end
		end

		[Module, Class].each do |klass|
			refine klass do
				def demodulize
					name.demodulize
				end
			end
		end
	end
end
