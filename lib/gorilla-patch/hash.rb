module GorillaPatch
	## Refine Hash class
	module HashExt
		refine Hash do
			def keys_to_sym(deep: false)
				each_with_object({}) do |(key, val), hash_sym|
					val = val.keys_to_sym(deep: deep) if deep && val.is_a?(Hash)
					key = key.to_sym if key.respond_to?(:to_sym)
					hash_sym[key] = val
				end
			end

			def keys_to_sym!(deep: false)
				hash_sym = keys_to_sym(deep: deep)
				clear.merge! hash_sym
			end

			def keys_to_s(deep: false)
				each_with_object({}) do |(key, val), hash_s|
					val = val.keys_to_s(deep: deep) if deep && val.is_a?(Hash)
					key = key.to_s if key.respond_to?(:to_s)
					hash_s[key] = val
				end
			end

			def keys_to_s!(deep: false)
				hash_s = keys_to_s(deep: deep)
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

			def slice(*keys)
				keys.each_with_object({}) { |k, hash| hash[k] = self[k] if key?(k) }
			end

			def slice!(*keys)
				omit = slice(*self.keys - keys)
				hash = slice(*keys)
				replace(hash)
				omit
			end

			def keys?(*keys)
				keys.all? { |k| key?(k) }
			end
		end
	end
end
