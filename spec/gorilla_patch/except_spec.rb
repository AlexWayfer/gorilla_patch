# frozen_string_literal: true

describe GorillaPatch::Except do
	using described_class

	describe Hash do
		let(:hash) { { a: 1, b: 2, c: 3, d: 4 } }
		let(:excepted_keys) { %i[b d] }

		describe '#except' do
			subject(:result) { hash.except(*excepted_keys) }

			it { is_expected.to eq(a: 1, c: 3) }
			it { is_expected.not_to be hash }

			describe 'usage of `super` for Ruby >= 3.0' do
				before do
					allow(hash).to receive(:dup).and_call_original
					result
				end

				if RUBY_VERSION >= '3.0'
					it { expect(hash).not_to have_received(:dup) }
				else
					it { expect(hash).to have_received(:dup).once }
				end
			end
		end

		describe '#except!' do
			subject { hash.except!(*excepted_keys) }

			it { is_expected.to eq(a: 1, c: 3) }
			it { is_expected.to be hash }
		end
	end
end
