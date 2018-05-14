# frozen_string_literal: true

Dir.glob(
	File.join(__dir__, 'gorilla_patch', '*.rb')
).each { |file| require file }
