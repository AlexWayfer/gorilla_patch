require 'spec_helper'

describe GorillaPatch::Except do
	using GorillaPatch::Except

	describe Hash do
		let(:hash) { { a: 1, b: 2, c: 3, d: 4 } }

		describe '#except' do
			subject { hash.except(:b, :d) }

			it { expect(subject).to eq(a: 1, c: 3) }
			it { expect(subject).not_to be hash }
		end

		describe '#except!' do
			subject { hash.except!(:b, :d) }

			it { expect(subject).to eq(a: 1, c: 3) }
			it { expect(subject).to be hash }
		end
	end
end
