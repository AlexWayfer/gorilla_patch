# frozen_string_literal: true

Dir.glob(
	File.join(__dir__, 'gorilla-patch', '*.rb')
).each { |file| require file }
