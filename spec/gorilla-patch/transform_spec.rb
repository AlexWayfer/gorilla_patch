# frozen_string_literal: true

describe GorillaPatch::Transform do
	using GorillaPatch::Transform

	describe Hash do
		let(:init_hash) { { a: 1, b: 2, c: 3 } }

		describe '#transform_values' do
			subject { init_hash.transform_values { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to_not be init_hash }
		end

		describe '#transform_values!' do
			subject { init_hash.transform_values! { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to be init_hash }
		end
	end
end
