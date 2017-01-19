require 'spec_helper'

describe GorillaPatch::Truncate do
	using GorillaPatch::Truncate

	describe String, '#hash' do
		let(:string) { 'Once upon a time in a world far far away' }

		it { expect(string.truncate(27)).to eq 'Once upon a time in a wo...' }

		it do
			expect(string.truncate(27, separator: ' '))
				.to eq 'Once upon a time in a...'
		end
		it do
			expect(string.truncate(27, separator: /\s/))
				.to eq 'Once upon a time in a...'
		end

		it do
			expect(string.truncate(27, omission: '... (continued)'))
				.to eq 'Once upon a ... (continued)'
		end
		it do
			expect(string.truncate(27, separator: ' ', omission: '... (continued)'))
				.to eq 'Once upon a... (continued)'
		end

		it { expect(string.truncate(40)).to eq string }

		it { expect(string.truncate(27)).not_to be string }
	end
end
