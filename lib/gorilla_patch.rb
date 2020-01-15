# frozen_string_literal: true

Dir.glob(
	File.join(__dir__, 'gorilla_patch', '*.rb')
).sort.each { |file| require file }
