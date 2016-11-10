module GorillaPatch
	## Adding case-changing methods
	module LettersCase
		def self.used(namespace)
			puts "Using in #{namespace}!"
		end

		refine String do
			def underscore
				gsub(/::/, '/')
					.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
					.gsub(/([a-z\d])([A-Z])/, '\1_\2')
					.tr('-', '_')
					.downcase
			end

			def camelize
				split('/')
					.map { |s| s.split('_').collect(&:capitalize).join }
					.join('::')
			end
		end

		refine Module do
			def underscore
				to_s.underscore
			end
		end
	end
end
