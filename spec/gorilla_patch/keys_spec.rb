# frozen_string_literal: true

describe GorillaPatch::Keys do
	using described_class

	describe Hash, '#keys?' do
		let(:hash) { { a: 1, b: 2, c: 3 } }

		it { expect(hash.keys?(:a, :b)).to be true }
		it { expect(hash.keys?(:a, :b, :d)).to be false }
	end
end
