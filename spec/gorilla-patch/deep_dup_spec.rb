# frozen_string_literal: true

describe GorillaPatch::DeepDup do
	using GorillaPatch::DeepDup

	describe String do
		let!(:string) { 'String' }

		it { expect(string.deep_dup).to eq string }
		it { expect(string.deep_dup).not_to be string }
	end

	describe Symbol do
		let!(:symbol) { :symbol }

		it { expect(symbol.deep_dup).to eq symbol }
		it { expect(symbol.deep_dup).to be symbol }
	end

	describe Hash do
		let(:hash) { { a: 1, b: [2, 3], c: { d: 4 } } }

		it { expect(hash.deep_dup).to eq hash }
		it { expect(hash.deep_dup).not_to be hash }
		it { expect(hash.deep_dup[:b]).not_to be hash[:b] }
		it { expect(hash.deep_dup[:c]).not_to be hash[:c] }
	end

	describe Array do
		let(:array) { [1, [2, 3], { d: 4 }] }

		it { expect(array.deep_dup).to eq array }
		it { expect(array.deep_dup).not_to be array }
		it { expect(array.deep_dup[1]).not_to be array[1] }
		it { expect(array.deep_dup[2]).not_to be array[2] }
	end

	require 'delegate'

	describe Delegator do
		describe 'where `#dup` exists' do
			require 'tempfile'

			let(:tempfile) { Tempfile.new('foo') }

			it { expect(tempfile.deep_dup.path).to eq tempfile.path }
			it { expect(tempfile.deep_dup).not_to be tempfile }
		end

		describe "where `#dup` doesn't exist" do
			let(:object) { DelegateClass(BasicObject).new(BasicObject.new) }

			it { expect(object.deep_dup).to eq object }
			it { expect(object.deep_dup).to be object }
		end
	end
end
