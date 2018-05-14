# frozen_string_literal: true

module GorillaPatch
	## Inflections
	module Inflections
		def self.acronyms
			@acronyms ||= %w[API HTML XML JSON SSL IP HTTP HTTPS]
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
				acronyms = GorillaPatch::Inflections.acronyms
				split('/')
					.map do |s|
						s.split(/([[:upper:]][[:lower:]]*)|_|-/).collect do |part|
							upcased_part = part.upcase
							acronyms.include?(upcased_part) ? upcased_part : part.capitalize
						end.join
					end
					.join('::')
			end
		end

		refine Module do
			def underscore
				to_s.underscore
			end
		end

		def self.from_sequel
			@from_sequel ||= Module.new do
				require 'sequel'

				refine String do
					Sequel::Inflections.private_instance_methods.each do |method|
						define_method method do
							Sequel::Inflections.instance_method(method).bind(self).call(self)
						end
					end
				end
			end
		end

		def self.from_inflecto
			require 'inflecto-refinements'

			Inflecto::Refinements
		end
	end
end
