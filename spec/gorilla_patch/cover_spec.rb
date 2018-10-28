# frozen_string_literal: true

describe GorillaPatch::Cover do
	using GorillaPatch::Cover

	describe Range, '#cover?' do
		subject { (4..8).cover?(value) }

		context 'with other Range' do
			before do
				if RUBY_VERSION >= '2.6'
					expect(value).not_to receive(:first)
				else
					expect(value).to receive(:first).once.and_call_original
				end
			end

			context 'that covered' do
				let(:value) { 5..7 }

				it { is_expected.to be true }
			end

			context 'that not covered' do
				let(:value) { 2..7 }

				it { is_expected.to be false }
			end
		end

		context 'with standard types (Integer)' do
			context 'that covered' do
				let(:value) { 5 }

				it { is_expected.to be true }
			end

			context 'that not covered' do
				let(:value) { 2 }

				it { is_expected.to be false }
			end
		end
	end
end
