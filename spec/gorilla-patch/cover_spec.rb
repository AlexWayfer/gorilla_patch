# frozen_string_literal: true

require 'spec_helper'

describe GorillaPatch::Cover do
	using GorillaPatch::Cover

	describe Range, '#cover?' do
		context 'with other Range' do
			context 'that covered' do
				it { expect((4..8).cover?(5..7)).to be true }
			end

			context 'that not covered' do
				it { expect((4..8).cover?(2..7)).to be false }
			end
		end

		context 'with standard types (Integer)' do
			context 'that covered' do
				it { expect((4..8).cover?(5)).to be true }
			end

			context 'that not covered' do
				it { expect((4..8).cover?(2)).to be false }
			end
		end
	end
end
