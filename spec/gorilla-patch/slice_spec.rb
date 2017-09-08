# frozen_string_literal: true

describe GorillaPatch::Slice do
	using GorillaPatch::Slice

	describe Hash do
		let(:hash) { { a: 1, b: 2, c: 3 } }

		describe '#slice' do
			it { expect(hash.slice(:a, :b)).to eq(a: 1, b: 2) }
			it { expect(hash.slice(:a, :b)).not_to be hash }
		end

		describe '#slice!' do
			it { expect(hash.slice!(:a, :b)).to eq(c: 3) }
			it { expect(hash.slice!(:a, :b)).not_to be hash }
			it do
				hash.slice!(:a, :b)
				expect(hash).to eq(a: 1, b: 2)
			end
		end

		describe '#slice_reverse!' do
			it { expect(hash.slice_reverse!(:a, :b)).to eq(a: 1, b: 2) }
			it { expect(hash.slice_reverse!(:a, :b)).not_to be hash }
			it do
				hash.slice_reverse!(:a, :b)
				expect(hash).to eq(c: 3)
			end
		end
	end
end
