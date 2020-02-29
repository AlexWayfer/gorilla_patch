# frozen_string_literal: true

describe GorillaPatch::DeepMerge do
	using described_class

	describe Hash do
		let(:init_hash)   { { a: 1, b: [2, 3], c: { d: 4      } } }
		let(:merged_hash) { { a: 5,            c: { e: [6, 7] } } }

		describe '#deep_merge' do
			subject(:result) { init_hash.deep_merge(merged_hash) }

			it { expect(result).to eq(a: 5, b: [2, 3], c: { d: 4, e: [6, 7] }) }
			it { expect(result).not_to be init_hash }
			it { expect(result[:b]).not_to be init_hash[:b] }
			it { expect(result[:c]).not_to be init_hash[:c] }
			it { expect(result[:c][:e]).to be merged_hash[:c][:e] }

			context 'with block' do
				subject(:result) do
					init_hash.deep_merge(merged_hash) do |_key, this_val, other_val|
						this_val + other_val
					end
				end

				let(:init_hash)   { { a: 100, b: 200, c: { c1: 100 } } }
				let(:merged_hash) { {         b: 250, c: { c1: 200 } } }

				it { expect(result).to eq(a: 100, b: 450, c: { c1: 300 }) }
			end
		end

		describe '#deep_merge!' do
			subject(:result) { init_hash.deep_merge!(merged_hash) }

			it { expect(result).to eq(a: 5, b: [2, 3], c: { d: 4, e: [6, 7] }) }
			it { expect(result).to be init_hash }

			it do
				value_at_b = init_hash[:b]
				expect(result[:b]).to be value_at_b
			end

			it do
				value_at_c = init_hash[:c]
				expect(result[:c]).to be value_at_c
			end

			it { expect(result[:c][:e]).to be merged_hash[:c][:e] }
		end
	end
end
