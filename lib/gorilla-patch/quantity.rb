module GorillaPatch
	## Refine String class by Sequel Inflections
	module Quantity
		def self.from_sequel
			@from_sequel ||= Module.new do
				require 'sequel'

				refine String do
					Sequel::Inflections.private_instance_methods.each do |method|
						define_method method do
							Sequel::Inflections.instance_method(method).bind(self).call(self)
						end
					end
				end
			end
		end
	end
end
