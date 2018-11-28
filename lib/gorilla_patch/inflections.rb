# frozen_string_literal: true

module GorillaPatch
	## Inflections
	module Inflections
		class << self
			def acronyms
				@acronyms ||= %w[API HTML XML JSON SSL ID IP HTTP HTTPS]
			end

			def acronyms_regex
				/(?:(?<=([A-Z\d_]))|\b)((?i)#{acronyms.join('|')})(?=\b|[^a-z])/
			end
		end

		refine String do
			def underscore
				result = gsub('::', '/')
				result.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
				result.gsub!(GorillaPatch::Inflections.acronyms_regex) do
					"#{Regexp.last_match(1) && '_'}#{Regexp.last_match(2).downcase}"
				end
				result.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
				result.tr!('-', '_')
				result.downcase
			end

			def camelize
				acronyms = GorillaPatch::Inflections.acronyms

				result = gsub(GorillaPatch::Inflections.acronyms_regex) do
					acronyms.find do |acronym|
						acronym.downcase == Regexp.last_match(2).downcase
					end
				end
				result.gsub!(%r{(?:^|_|-|(/))([a-z\d]*)}) do
					"#{Regexp.last_match(1)}#{Regexp.last_match(2).capitalize}"
				end
				result.gsub('/', '::')
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
