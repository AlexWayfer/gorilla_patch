# frozen_string_literal: true

module GorillaPatch
	## Inflections
	module Inflections
		class << self
			## Set of acronyms which can be modified externally
			def acronyms
				@acronyms ||= %w[
					API DateTime FAQ HTML HTTP HTTPS ID IP JSON SEO SSL UTM XML
				]
			end

			## Regular expression for detecting known acronyms
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

		## Use inflections from Sequel
		def self.from_sequel
			@from_sequel ||= Module.new do
				require 'sequel'

				refine String do
					extend MethodsFromSequel

					define_methods_from_sequel
				end
			end
		end

		## Module for definition methods from Sequel
		## https://sequel.jeremyevans.net/
		module MethodsFromSequel
			private

			def define_methods_from_sequel
				Sequel::Inflections.private_instance_methods.each do |method_name|
					define_method method_name do
						Sequel::Inflections.instance_method(method_name)
							.bind(self).call(self)
					end
				end
			end
		end

		private_constant :MethodsFromSequel

		## Use inflections from DRY Inflector
		## https://dry-rb.org/gems/dry-inflector/
		def self.from_dry_inflector
			@from_dry_inflector ||= Module.new do
				require 'dry/inflector'

				refine String do
					extend MethodsFromDryInflector

					define_methods_from_dry_inflector
				end
			end
		end

		## Module for definition methods from Dry::Inflector
		module MethodsFromDryInflector
			private

			def define_methods_from_dry_inflector
				inflector = Dry::Inflector.new

				inflector.public_methods.each do |method_name|
					define_method method_name do
						inflector.public_send method_name, self
					end
				end
			end
		end

		private_constant :MethodsFromDryInflector
	end
end
