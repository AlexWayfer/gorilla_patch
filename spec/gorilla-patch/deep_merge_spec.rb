require 'spec_helper'

describe GorillaPatch::DeepMerge do
	using GorillaPatch::DeepMerge

	describe Hash do
		let(:init_hash)   { { a: 1, b: [2, 3], c: { d: 4      } } }
		let(:merged_hash) { { a: 5,            c: { e: [6, 7] } } }

		describe '#deep_merge' do
			subject { init_hash.deep_merge(merged_hash) }

			it { expect(subject).to eq(a: 5, b: [2, 3], c: { d: 4, e: [6, 7] }) }
			it { expect(subject).not_to be init_hash }
			it { expect(subject[:b]).to be init_hash[:b] }
			it { expect(subject[:c][:e]).to be merged_hash[:c][:e] }
		end

		describe '#deep_merge!' do
			subject { init_hash.deep_merge!(merged_hash) }

			it { expect(subject).to eq(a: 5, b: [2, 3], c: { d: 4, e: [6, 7] }) }
			it { expect(subject).to be init_hash }
			it { expect(subject[:b]).to be init_hash[:b] }
			it { expect(subject[:c][:e]).to be merged_hash[:c][:e] }
		end
	end
end
