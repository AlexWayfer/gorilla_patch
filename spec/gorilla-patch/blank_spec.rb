# frozen_string_literal: true

describe GorillaPatch::Blank do
	using GorillaPatch::Blank

	describe String, '#blank?' do
		it { expect(''.blank?).to be true }
		it { expect('   '.blank?).to be true }
		it { expect(" \n\r ".blank?).to be true }
		it { expect('  a  '.blank?).to be false }
	end

	describe NilClass, '#blank?' do
		it { expect(nil.blank?).to be true }
	end

	describe Array do
		let(:array) do
			[1, nil, '', 'a', [''], [nil, '', 3], {}, { a: nil, b: '', c: 3 }, 1..10]
		end

		describe 'reject_blank_strings' do
			it do
				expect(array.reject_blank_strings).to eq(
					[1, nil, 'a', [nil, 3], { a: nil, c: 3 }, 1..10]
				)
			end
			it { expect(array.reject_blank_strings).not_to be array }
		end

		describe 'reject_blank_strings!' do
			it do
				expect(array.reject_blank_strings!).to eq(
					[1, nil, 'a', [nil, 3], { a: nil, c: 3 }, 1..10]
				)
			end
			it { expect(array.reject_blank_strings!).to be array }
		end

		describe 'nilify_blank_strings' do
			it do
				expect(array.nilify_blank_strings).to eq(
					[
						1, nil, nil, 'a', [nil], [nil, nil, 3], {},
						{ a: nil, b: nil, c: 3 }, 1..10
					]
				)
			end
			it { expect(array.nilify_blank_strings).not_to be array }
		end

		describe 'nilify_blank_strings!' do
			it do
				expect(array.nilify_blank_strings!).to eq(
					[
						1, nil, nil, 'a', [nil], [nil, nil, 3], {},
						{ a: nil, b: nil, c: 3 }, 1..10
					]
				)
			end
			it { expect(array.nilify_blank_strings!).to be array }
		end
	end

	describe Hash do
		let(:hash) do
			{
				a: 1, b: '', c: '3',
				d: [], e: [nil, '', 3],
				f: {}, g: { a: nil, b: '', c: 3 }
			}
		end

		describe 'reject_blank_strings' do
			it do
				expect(hash.reject_blank_strings).to eq(
					a: 1, c: '3', e: [nil, 3], g: { a: nil, c: 3 }
				)
			end
			it { expect(hash.reject_blank_strings).not_to be hash }
		end

		describe 'reject_blank_strings!' do
			it do
				expect(hash.reject_blank_strings!).to eq(
					a: 1, c: '3', e: [nil, 3], g: { a: nil, c: 3 }
				)
			end
			it { expect(hash.reject_blank_strings!).to be hash }
		end

		describe 'nilify_blank_strings' do
			it do
				expect(hash.nilify_blank_strings).to eq(
					a: 1, b: nil, c: '3',
					d: [], e: [nil, nil, 3],
					f: {}, g: { a: nil, b: nil, c: 3 }
				)
			end
			it { expect(hash.nilify_blank_strings).not_to be hash }
		end

		describe 'nilify_blank_strings!' do
			it do
				expect(hash.nilify_blank_strings!).to eq(
					a: 1, b: nil, c: '3',
					d: [], e: [nil, nil, 3],
					f: {}, g: { a: nil, b: nil, c: 3 }
				)
			end
			it { expect(hash.nilify_blank_strings!).to be hash }
		end
	end
end
