# frozen_string_literal: true

module GorillaPatch
	## Module for transformations methods
	module Transform
		refine Hash do
			def transform_values
				return super if defined? super
				each_with_object(self.class.new) do |(key, value), result|
					result[key] = yield value
				end
			end

			def transform_values!
				return super if defined? super
				each do |key, value|
					self[key] = yield value
				end
			end
		end
	end
end
