# frozen_string_literal: true

describe GorillaPatch::Except do
	using described_class

	describe Hash do
		let(:hash) { { a: 1, b: 2, c: 3, d: 4 } }
		let(:excepted_keys) { %i[b d] }

		describe '#except!' do
			subject { hash.except!(*excepted_keys) }

			it { is_expected.to eq(a: 1, c: 3) }
			it { is_expected.to be hash }
		end
	end
end
