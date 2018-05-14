# frozen_string_literal: true

module GorillaPatch
	## Adding namespaces-changing methods
	module Namespace
		refine String do
			def demodulize
				split('::').last.to_s
			end

			def deconstantize
				self[0, rindex('::') || 0]
			end
		end

		[Module, Class].each do |klass|
			refine klass do
				def demodulize
					name.to_s.demodulize
				end

				def deconstantize
					name.to_s.deconstantize
				end
			end
		end
	end
end
