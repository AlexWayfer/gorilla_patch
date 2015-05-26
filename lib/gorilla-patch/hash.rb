module GorillaPatch
	module HashExt

		refine Hash do

			def keys_to_sym
				inject({}) { | hash_sym, (key, val) | hash_sym[key.to_sym] = val; hash_sym }
			end

			def keys_to_sym!
				hash_sym = keys_to_sym
				self.clear.merge! hash_sym
			end

		end

	end
end