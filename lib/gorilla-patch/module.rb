module GorillaPatch
	module ModuleExt

		refine Module do

			def demodulize
				to_s.split('::').last
			end

		end

	end
end