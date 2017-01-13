require 'spec_helper'

describe GorillaPatch::Blank do
	using GorillaPatch::Blank

	describe String, '#blank?' do
		it { expect(''.blank?).to be true }
		it { expect('   '.blank?).to be true }
		it { expect(" \n\r ".blank?).to be true }
		it { expect('  a  '.blank?).to be false }
	end

	describe Array do
		let(:array) { [1, nil, '', 'a', [''], {}] }

		describe 'reject_blank_strings' do
			it { expect(array.reject_blank_strings).to eq [1, nil, 'a'] }
			it { expect(array.reject_blank_strings).not_to be array }
		end

		describe 'reject_blank_strings!' do
			it { expect(array.reject_blank_strings!).to eq [1, nil, 'a'] }
			it { expect(array.reject_blank_strings!).to be array }
		end
	end

	describe Hash do
		let(:hash) { { a: 1, b: '', c: '3' } }

		describe 'reject_blank_strings' do
			it { expect(hash.reject_blank_strings).to eq(a: 1, c: '3') }
			it { expect(hash.reject_blank_strings).not_to be hash }
		end

		describe 'reject_blank_strings!' do
			it { expect(hash.reject_blank_strings!).to eq(a: 1, c: '3') }
			it { expect(hash.reject_blank_strings!).to be hash }
		end
	end
end
