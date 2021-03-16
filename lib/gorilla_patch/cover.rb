# frozen_string_literal: true

module GorillaPatch
	## Adding include methods
	module Cover
		if RUBY_VERSION < '2.6'
			refine Range do
				def cover?(value)
					return super unless value.is_a?(Range)

					super(value.first) && super(value.last)
				end
			end
		end
	end
end
