# frozen_string_literal: true

describe GorillaPatch::Compact do
	using described_class

	describe Hash do
		describe '#compact' do
			let(:hash) { { a: 1 } }

			it { expect({ a: 1, b: nil }.compact).to eq(a: 1) }
			it { expect({ a: 1, b: 2 }.compact).to eq(a: 1, b: 2) }
			it { expect(hash.compact).not_to be hash }
		end

		describe '#compact!' do
			let(:hash) { { a: 1 } }

			it { expect({ a: 1, b: nil }.compact!).to eq(a: 1) }
			it { expect({ a: 1, b: 2 }.compact!).to eq(a: 1, b: 2) }
			it { expect(hash.compact!).to be hash }
		end
	end
end
