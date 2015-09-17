module GorillaPatch
	module HashExt

		refine Hash do

			def keys_to_sym
				each_with_object({}) { |(key, val), hash_sym| hash_sym[key.to_sym] = val }
			end

			def keys_to_sym!
				hash_sym = keys_to_sym
				clear.merge! hash_sym
			end

			def keys_to_s
				each_with_object({}) { |(key, val), hash_s| hash_s[key.to_s] = val }
			end

			def keys_to_s!
				hash_s = keys_to_s
				clear.merge! hash_s
			end

			def except(*keys)
				dup.except!(*keys)
			end

			def except!(*keys)
				keys.each { |key| delete(key) }
				self
			end

			def compact
				dup.compact!
			end

			def compact!
				delete_if { |_k, v| v.nil? }
			end

		end

	end
end
