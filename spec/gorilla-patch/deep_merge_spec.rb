# frozen_string_literal: true

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

			context 'with block' do
				let(:init_hash)   { { a: 100, b: 200, c: { c1: 100 } } }
				let(:merged_hash) { {         b: 250, c: { c1: 200 } } }

				subject do
					init_hash.deep_merge(merged_hash) do |_key, this_val, other_val|
						this_val + other_val
					end
				end

				it { expect(subject).to eq(a: 100, b: 450, c: { c1: 300 }) }
			end
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
