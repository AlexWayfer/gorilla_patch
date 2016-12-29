module GorillaPatch
	## Adding case-changing methods
	module LettersCase
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
					.map do |s|
						s.split(/([[:upper:]][[:lower:]]+)|_/).collect(&:capitalize).join
					end
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
