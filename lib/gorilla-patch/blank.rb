require_relative 'deep_dup'

module GorillaPatch
	## Adding blank methods
	module Blank
		refine String do
			def blank?
				strip.empty?
			end
		end

		## Common methods for Hash and Array
		module RejectBlankStrings
			def reject_blank_strings(value)
				deep_reject_blank_strings_in(value).empty?
			rescue NoMethodError
				false
			end

			def reject_blank_strings!
				replace reject_blank_strings
			end

			private

			def deep_reject_blank_strings_in(object)
				case object
				when String
					object.strip
				when Hash, Array
					object.reject_blank_strings!
				else
					object
				end
			end
		end

		refine Array do
			include RejectBlankStrings

			using GorillaPatch::DeepDup

			def reject_blank_strings
				deep_dup.reject do |value|
					super value
				end
			end
		end

		refine Hash do
			include RejectBlankStrings

			using GorillaPatch::DeepDup

			def reject_blank_strings
				deep_dup.reject do |_key, value|
					super value
				end
			end
		end
	end
end
