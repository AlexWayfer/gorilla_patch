require 'spec_helper'

describe GorillaPatch::Keys do
	using GorillaPatch::Keys

	describe Hash, '#keys?' do
		let(:hash) { { a: 1, b: 2, c: 3 } }

		it { expect(hash.keys?(:a, :b)).to be true }
		it { expect(hash.keys?(:a, :b, :d)).to be false }
	end
end
