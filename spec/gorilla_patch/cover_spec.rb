# frozen_string_literal: true

describe GorillaPatch::Cover do
	using described_class

	describe Range, '#cover?' do
		subject(:result) { (4..8).cover?(value) }

		context 'with other Range' do
			context 'when covers' do
				## https://bugs.ruby-lang.org/issues/15504#note-16
				let(:value) { (5..7).dup }

				it { is_expected.to be true }

				describe 'usage of `super` for Ruby >= 2.6' do
					before do
						allow(value).to receive(:first).and_call_original
						result
					end

					if RUBY_VERSION >= '2.6'
						it { expect(value).not_to have_received(:first) }
					else
						it { expect(value).to have_received(:first).once }
					end
				end
			end

			context 'when does not cover' do
				let(:value) { 2..7 }

				it { is_expected.to be false }
			end
		end

		context 'with standard types (Integer)' do
			context 'when covers' do
				let(:value) { 5 }

				it { is_expected.to be true }
			end

			context 'when does not cover' do
				let(:value) { 2 }

				it { is_expected.to be false }
			end
		end
	end
end
