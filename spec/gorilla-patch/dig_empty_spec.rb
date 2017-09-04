# frozen_string_literal: true

require 'spec_helper'

describe GorillaPatch::DigEmpty do
	using GorillaPatch::DigEmpty

	describe Hash do
		let(:hash) { { a: { b: { c: { d: 4 } } } } }

		describe '#dig' do
			it 'should works as regular #dig' do
				expect(hash.dig(:a, :b, :c, :d)).to eq 4
			end

			it 'should works with 0 arguments' do
				keys = []
				expect(hash.dig(*keys)).to be hash
			end
		end
	end
end
