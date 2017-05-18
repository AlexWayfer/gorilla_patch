# frozen_string_literal: true

module GorillaPatch
	## Adding compact methods
	module Compact
		refine Hash do
			def compact
				select { |_key, value| !value.nil? }
			end

			def compact!
				delete_if { |_key, value| value.nil? }
			end
		end
	end
end
