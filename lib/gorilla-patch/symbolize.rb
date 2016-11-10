module GorillaPatch
	## Adding symbolize methods
	module Symbolize
		refine Hash do
			def symbolize_keys(deep: false)
				each_with_object({}) do |(key, value), hash|
					value = deep_symbolize_keys_in(value) if deep
					key = key.to_sym if key.respond_to?(:to_sym)
					hash[key] = value
				end
			end

			def symbolize_keys!(deep: false)
				replace symbolize_keys(deep: deep)
			end

			private

			def deep_symbolize_keys_in(object)
				case object
				when Hash
					object.symbolize_keys(deep: true)
				when Array
					object.map { |el| deep_symbolize_keys_in(el) }
				else
					object
				end
			end
		end
	end
end
