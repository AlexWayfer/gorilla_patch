# frozen_string_literal: true

describe GorillaPatch::Slice do
	using described_class

	describe Hash do
		let(:init_hash) { { a: 1, b: 2, c: 3 } }
		let(:sliced_keys) { %i[a b x] }

		describe '#slice' do
			describe 'default behavior' do
				subject(:result) { init_hash.slice(*sliced_keys) }

				it { is_expected.to eq(a: 1, b: 2) }
				it { is_expected.not_to be init_hash }

				## https://github.com/rubocop-hq/rubocop-rspec/pull/1018
				# rubocop:disable RSpec/EmptyExampleGroup
				describe 'usage of `super` for Ruby >= 2.5' do
					before do
						allow(init_hash).to receive(:key?)
						result
					end

					if RUBY_VERSION >= '2.5'
						it { expect(init_hash).not_to have_received(:key?) }
					else
						it { expect(init_hash).to have_received(:key?).exactly(sliced_keys.size).times }
					end
				end
				# rubocop:enable RSpec/EmptyExampleGroup
			end

			context 'with nils' do
				subject(:result) { init_hash.slice(*sliced_keys, nils: true) }

				it { is_expected.to eq(a: 1, b: 2, x: nil) }
				it { is_expected.not_to be init_hash }

				describe 'no usage of `super` even for Ruby >= 2.5' do
					before do
						allow(init_hash).to receive(:[])
						result
					end

					it do
						expect(init_hash).to have_received(:[]).exactly(sliced_keys.size).times
						result
					end
				end
			end
		end

		describe '#slice!' do
			describe 'default behavior' do
				subject(:result) { init_hash.slice!(*sliced_keys) }

				it { is_expected.to eq(c: 3) }
				it { is_expected.not_to be init_hash }

				describe 'mutation of initial Hash' do
					before do
						result
					end

					it { expect(init_hash).to eq(a: 1, b: 2) }
				end
			end

			context 'with nils' do
				subject(:result) { init_hash.slice!(*sliced_keys, nils: true) }

				it { is_expected.to eq(c: 3) }
				it { is_expected.not_to be init_hash }

				describe 'mutation of initial Hash' do
					before do
						result
					end

					it { expect(init_hash).to eq(a: 1, b: 2, x: nil) }
				end
			end
		end

		describe '#slice_reverse!' do
			describe 'default behavior' do
				subject(:result) { init_hash.slice_reverse!(*sliced_keys) }

				it { is_expected.to eq(a: 1, b: 2) }
				it { is_expected.not_to be init_hash }

				describe 'mutation of initial Hash' do
					before do
						result
					end

					it { expect(init_hash).to eq(c: 3) }
				end
			end

			context 'with nils' do
				subject(:result) { init_hash.slice_reverse!(*sliced_keys, nils: true) }

				it { is_expected.to eq(a: 1, b: 2, x: nil) }
				it { is_expected.not_to be init_hash }

				describe 'mutation of initial Hash' do
					before do
						result
					end

					it { expect(init_hash).to eq(c: 3) }
				end
			end
		end
	end
end
