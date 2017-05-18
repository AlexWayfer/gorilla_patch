# frozen_string_literal: true

module GorillaPatch
	## Inflections
	module Inflections
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
						s.split(/([[:upper:]][[:lower:]]*)|_|-/).collect(&:capitalize).join
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
