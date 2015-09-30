module GorillaPatch
	## Refine Array class
	module ArrayExt
		refine Array do
			def compare(other)
				other = [other] unless other.is_a?(Array)
				sort == other.sort
			end

			def include_any?(*items)
				items = items.first if items.length == 1 && items.first.is_a?(Array)
				!(self & items).empty?
			end
		end
	end
end
