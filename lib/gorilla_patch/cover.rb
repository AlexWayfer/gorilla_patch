# frozen_string_literal: true

module GorillaPatch
	## Adding include methods
	module Cover
		refine Range do
			if RUBY_VERSION < '2.6'
				def cover?(value)
					return super unless value.is_a?(Range)

					super(value.first) && super(value.last)
				end
			end
		end
	end
end
