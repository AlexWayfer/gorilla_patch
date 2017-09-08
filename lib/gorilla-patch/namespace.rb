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
				%i[demodulize deconstantize].each do |method_name|
					define_method method_name do
						name.to_s.send method_name
					end
				end
			end
		end
	end
end
