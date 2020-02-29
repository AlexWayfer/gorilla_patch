# frozen_string_literal: true

describe GorillaPatch::Except do
	using described_class

	describe Hash do
		let(:hash) { { a: 1, b: 2, c: 3, d: 4 } }

		describe '#except' do
			subject { hash.except(:b, :d) }

			it { is_expected.to eq(a: 1, c: 3) }
			it { is_expected.not_to be hash }
		end

		describe '#except!' do
			subject { hash.except!(:b, :d) }

			it { is_expected.to eq(a: 1, c: 3) }
			it { is_expected.to be hash }
		end
	end
end
