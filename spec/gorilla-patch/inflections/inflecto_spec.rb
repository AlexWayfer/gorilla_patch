require 'gorilla-patch/inflections'

describe 'GorillaPatch::Inflections.from_inflecto' do
	using GorillaPatch::Inflections.from_inflecto

	describe String do
		it 'has methods' do
			expect(
				%i(
					camelize constantize dasherize demodulize humanize
					pluralize singularize underscore
				).reject { |m| 'GorillaPatch'.send m }
			).to be_empty
		end
	end
end
