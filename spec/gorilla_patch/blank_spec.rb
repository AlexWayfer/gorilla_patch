# frozen_string_literal: true

describe GorillaPatch::Blank do
	using described_class

	describe String, '#blank?' do
		it { expect(''.blank?).to be true }
		it { expect('   '.blank?).to be true }
		it { expect(" \n\r ".blank?).to be true }
		it { expect('  a  '.blank?).to be false }
	end

	describe NilClass, '#blank?' do
		it { expect(nil.blank?).to be true }
	end

	describe Object, '#blank?' do
		subject { object.blank? }

		let(:object) { object_class.new }

		context 'when object has `#empty?` method' do
			let(:object_class) do
				Class.new(Object) do
					def empty?
						true
					end
				end
			end

			it { is_expected.to be true }
		end

		context 'when object has no `#empty?` method' do
			let(:object_class) do
				Class.new(Object) do
					undef_method :empty? if respond_to? :empty?
				end
			end

			it { is_expected.to be false }
		end
	end

	describe Array do
		subject(:array) do
			[1, nil, '', 'a', [''], [nil, '', 3], {}, { a: nil, b: '', c: 3 }, 1..10]
		end

		describe 'reject_blank_strings' do
			subject { super().reject_blank_strings }

			it { is_expected.to eq [1, nil, 'a', [nil, 3], { a: nil, c: 3 }, 1..10] }

			it { is_expected.not_to be array }
		end

		describe 'reject_blank_strings!' do
			subject { super().reject_blank_strings! }

			it { is_expected.to eq [1, nil, 'a', [nil, 3], { a: nil, c: 3 }, 1..10] }

			it { is_expected.to be array }
		end

		describe 'nilify_blank_strings' do
			subject { super().nilify_blank_strings }

			let(:expected_result) do
				[
					1, nil, nil, 'a', [nil], [nil, nil, 3], {},
					{ a: nil, b: nil, c: 3 }, 1..10
				]
			end

			it { is_expected.to eq expected_result }

			it { is_expected.not_to be array }
		end

		describe 'nilify_blank_strings!' do
			subject { super().nilify_blank_strings! }

			let(:expected_result) do
				[
					1, nil, nil, 'a', [nil], [nil, nil, 3], {},
					{ a: nil, b: nil, c: 3 }, 1..10
				]
			end

			it { is_expected.to eq expected_result }

			it { is_expected.to be array }
		end
	end

	describe Hash do
		subject(:hash) do
			{
				a: 1, b: '', c: '3',
				d: [], e: [nil, '', 3],
				f: {}, g: { a: nil, b: '', c: 3 }
			}
		end

		describe 'reject_blank_strings' do
			subject { super().reject_blank_strings }

			it { is_expected.to eq(a: 1, c: '3', e: [nil, 3], g: { a: nil, c: 3 }) }

			it { is_expected.not_to be hash }
		end

		describe 'reject_blank_strings!' do
			subject { super().reject_blank_strings! }

			it { is_expected.to eq(a: 1, c: '3', e: [nil, 3], g: { a: nil, c: 3 }) }

			it { is_expected.to be hash }
		end

		describe 'nilify_blank_strings' do
			subject { super().nilify_blank_strings }

			let(:expected_result) do
				{
					a: 1, b: nil, c: '3',
					d: [], e: [nil, nil, 3], f: {},
					g: { a: nil, b: nil, c: 3 }
				}
			end

			it { is_expected.to eq expected_result }

			it { is_expected.not_to be hash }
		end

		describe 'nilify_blank_strings!' do
			subject { super().nilify_blank_strings! }

			let(:expected_result) do
				{
					a: 1, b: nil, c: '3',
					d: [], e: [nil, nil, 3], f: {},
					g: { a: nil, b: nil, c: 3 }
				}
			end

			it { is_expected.to eq expected_result }

			it { is_expected.to be hash }
		end
	end

	describe Module, '#blank?' do
		subject { object.blank? }

		let(:object) { described_class.new }

		it { is_expected.to be false }
	end

	describe Class, '#blank?' do
		subject { object.blank? }

		let(:object) { described_class.new }

		it { is_expected.to be false }

		## There is `Sequel::Model.empty?`, which used inside `blank?`
		context 'when Class is `Sequel::Model`' do
			require 'sequel'

			let(:object) { described_class.new(Sequel::Model(:items)) }

			before do
				## https://github.com/jeremyevans/sequel/blob/ce5b073/spec/model/spec_helper.rb
				Sequel::Model.db = Sequel.mock
			end

			it { is_expected.to be false }
		end
	end
end
