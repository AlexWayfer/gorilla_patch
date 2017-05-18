# frozen_string_literal: true

require 'spec_helper'

describe GorillaPatch::Symbolize do
	using GorillaPatch::Symbolize

	describe Hash do
		let(:hash) { { 'a' => 1, 'b' => [{ 'c' => 3 }] } }
		describe 'symbolize_keys' do
			context 'when deep false' do
				it { expect(hash.symbolize_keys).to eq(a: 1, b: [{ 'c' => 3 }]) }
			end

			context 'when deep true' do
				it do
					expect(hash.symbolize_keys(deep: true)).to eq(a: 1, b: [{ c: 3 }])
				end
			end

			it { expect(hash.symbolize_keys).not_to be hash }
		end

		describe 'symbolize_keys!' do
			it { expect(hash.symbolize_keys!(deep: true)).to eq(a: 1, b: [{ c: 3 }]) }

			it { expect(hash.symbolize_keys!).to be hash }
		end
	end
end
