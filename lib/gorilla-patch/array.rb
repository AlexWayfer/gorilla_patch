module GorillaPatch
	module ArrayExt

		refine Array do

			def compare(other)
				other = [other] unless other.kind_of?(Array)
				sort == other.sort
			end

			def include_any?(*items)
				items = items.first if items.length == 1 && items.first.kind_of?(Array)
				!(self & items).empty?
			end

		end

	end
end