# frozen_string_literal: true

describe GorillaPatch::Transform do
	using GorillaPatch::Transform

	describe Hash do
		let(:init_hash) { { a: 1, b: 2, c: 3 } }

		describe '#transform_values' do
			subject { init_hash.transform_values { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to_not be init_hash }

			if RUBY_VERSION >= '2.4'
				it do
					expect(init_hash).not_to receive(:each_with_object)
					subject
				end
			else
				it do
					expect(init_hash).to receive(:each_with_object).once
					subject
				end
			end
		end

		describe '#transform_values!' do
			subject { init_hash.transform_values! { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to be init_hash }

			if RUBY_VERSION >= '2.4'
				it do
					expect(init_hash).not_to receive(:[]=)
					subject
				end
			else
				it do
					expect(init_hash).to receive(:[]=).exactly(init_hash.size).times
					subject
				end
			end
		end
	end
end
