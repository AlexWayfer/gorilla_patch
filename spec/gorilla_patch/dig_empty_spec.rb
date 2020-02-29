# frozen_string_literal: true

describe GorillaPatch::DigEmpty do
	using described_class

	describe Hash do
		let(:hash) { { a: { b: { c: { d: 4 } } } } }

		describe '#dig' do
			it 'works as regular #dig' do
				expect(hash.dig(:a, :b, :c, :d)).to eq 4
			end

			it 'works with 0 arguments' do
				keys = []
				expect(hash.dig(*keys)).to be hash
			end
		end
	end
end
