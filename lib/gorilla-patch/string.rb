module GorillaPatch
	## Refine String class
	module StringExt
		refine String do
			def underscore
				gsub(/::/, '/')
				  .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
				  .gsub(/([a-z\d])([A-Z])/, '\1_\2')
				  .tr('-', '_')
				  .downcase
			end

			def demodulize
				split('::').last
			end

			def camelize
				split('/')
				  .map { |s| s.split('_').collect(&:capitalize).join }
				  .join('::')
			end
		end

		def self.from_sequel
			@from_sequel ||= Module.new do
				refine String do
					require 'sequel'

					Sequel::Inflections.private_instance_methods.each do |method|
						define_method method do
							Sequel::Inflections.instance_method(method).bind(self).call(self)
						end
					end
				end
			end
		end
	end
end
