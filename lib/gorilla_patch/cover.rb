# frozen_string_literal: true

module GorillaPatch
	## Adding include methods
	module Cover
		refine Range do
			def cover?(value)
				return super unless value.is_a?(Range) && RUBY_VERSION < '2.6'

				super(value.first) && super(value.last)
			end
		end
	end
end
