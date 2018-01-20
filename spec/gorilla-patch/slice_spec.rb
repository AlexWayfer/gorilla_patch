# frozen_string_literal: true

describe GorillaPatch::Slice do
	using GorillaPatch::Slice

	describe Hash do
		let(:init_hash) { { a: 1, b: 2, c: 3 } }
		let(:sliced_keys) { %i[a b x] }

		describe '#slice' do
			describe 'default behavior' do
				subject { init_hash.slice(*sliced_keys) }

				it { is_expected.to eq(a: 1, b: 2) }
				it { is_expected.not_to be init_hash }

				if RUBY_VERSION >= '2.5'
					it do
						expect(init_hash).not_to receive(:key?)
						subject
					end
				else
					it do
						expect(init_hash).to receive(:key?).exactly(sliced_keys.size).times
						subject
					end
				end
			end

			context 'with nils' do
				subject { init_hash.slice(*sliced_keys, nils: true) }

				it { is_expected.to eq(a: 1, b: 2, x: nil) }
				it { is_expected.not_to be init_hash }

				it do
					expect(init_hash).to receive(:[]).exactly(sliced_keys.size).times
					subject
				end
			end
		end

		describe '#slice!' do
			describe 'default behavior' do
				subject { init_hash.slice!(*sliced_keys) }

				it { is_expected.to eq(c: 3) }
				it { is_expected.not_to be init_hash }
				it do
					subject
					expect(init_hash).to eq(a: 1, b: 2)
				end
			end

			context 'with nils' do
				subject { init_hash.slice!(*sliced_keys, nils: true) }

				it { is_expected.to eq(c: 3) }
				it { is_expected.not_to be init_hash }
				it do
					subject
					expect(init_hash).to eq(a: 1, b: 2, x: nil)
				end
			end
		end

		describe '#slice_reverse!' do
			describe 'default behavior' do
				subject { init_hash.slice_reverse!(*sliced_keys) }

				it { is_expected.to eq(a: 1, b: 2) }
				it { is_expected.not_to be init_hash }
				it do
					subject
					expect(init_hash).to eq(c: 3)
				end
			end

			context 'with nils' do
				subject { init_hash.slice_reverse!(*sliced_keys, nils: true) }

				it { is_expected.to eq(a: 1, b: 2, x: nil) }
				it { is_expected.not_to be init_hash }
				it do
					subject
					expect(init_hash).to eq(c: 3)
				end
			end
		end
	end
end
