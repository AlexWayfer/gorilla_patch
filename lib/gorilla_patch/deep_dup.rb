# frozen_string_literal: true

module GorillaPatch
	## Adding deep_dup method
	module DeepDup
		refine Object do
			def deep_dup
				dup
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
				map(&:deep_dup)
			end
		end

		require 'delegate'

		refine Delegator do
			def deep_dup
				dup
			rescue NoMethodError
				self
			end
		end
	end
end
