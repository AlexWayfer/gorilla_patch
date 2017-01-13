require 'spec_helper'

describe GorillaPatch::Compact do
	using GorillaPatch::Compact

	describe Hash do
		describe '#compact' do
			it { expect({ a: 1, b: nil }.compact).to eq(a: 1) }
			it { expect({ a: 1, b: 2 }.compact).to eq(a: 1, b: 2) }

			let(:hash) { { a: 1 } }
			it { expect(hash.compact).not_to be hash }
		end

		describe '#compact!' do
			it { expect({ a: 1, b: nil }.compact!).to eq(a: 1) }
			it { expect({ a: 1, b: 2 }.compact!).to eq(a: 1, b: 2) }

			let(:hash) { { a: 1 } }
			it { expect(hash.compact!).to be hash }
		end
	end
end
