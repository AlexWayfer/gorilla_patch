module GorillaPatch
	module HashExt

		refine Hash do

			def to_sym_keys
				inject({}) { | hash_sym, (key, val) | hash_sym[key.to_sym] = val; hash_sym }
			end

			def to_sym_keys!
				hash_sym = to_sym_keys
				self.clear.merge! hash_sym
			end

		end

	end
end