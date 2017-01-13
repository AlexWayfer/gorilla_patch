require 'gorilla-patch/inflections'

describe 'GorillaPatch::Inflections.from_sequel' do
	using GorillaPatch::Inflections.from_sequel

	describe String do
		it 'has methods' do
			expect(
				%i(camelize constantize demodulize pluralize singularize underscore)
					.reject { |m| 'GorillaPatch'.send m }
			).to be_empty
		end
	end
end
