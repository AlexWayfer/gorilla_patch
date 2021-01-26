# frozen_string_literal: true

module GorillaPatch
	## Adding parent methods
	module ModuleParent
		refine Module do
			def module_parent_name
				if defined?(@module_parent_name)
					@module_parent_name
				else
					module_parent_name = name =~ /::[^:]+\Z/ ? Regexp.last_match.pre_match : nil
					@module_parent_name = module_parent_name unless frozen?
					module_parent_name
				end
			end

			def module_parent
				module_parent_name ? Object.const_get(module_parent_name) : Object
			end
		end
	end
end
