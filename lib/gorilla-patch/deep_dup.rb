module GorillaPatch
	## Adding deep_dup method
	module DeepDup
		refine Object do
			def deep_dup
				dup
			rescue TypeError
				self
			end
		end

		refine Hash do
			def deep_dup
				each_with_object(dup) do |(key, value), hash|
					hash[key.deep_dup] = value.deep_dup
				end
			end
		end

		refine Array do
			def deep_dup
				map { |el| el.deep_dup }
			end
		end
	end
end
