# frozen_string_literal: true

describe GorillaPatch::Transform do
	using GorillaPatch::Transform

	describe Hash do
		class HashWithSetterCounter < Hash
			attr_reader :setter_counter

			def []=(key, value)
				@setter_counter ||= 0
				@setter_counter += 1
				super
			end
		end

		let(:init_hash) { HashWithSetterCounter[a: 1, b: 2, c: 3] }

		shared_examples 'calling super method if exist' do
			if RUBY_VERSION >= '2.4'
				it do
					if subject.is_a?(HashWithSetterCounter)
						expect(subject.setter_counter).to be_nil
					else
						is_expected.to be_instance_of(Hash)
					end
				end
			else
				it { expect(subject.setter_counter).to eq init_hash.size }
			end
		end

		describe '#transform_values' do
			subject { init_hash.transform_values { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to_not be init_hash }

			include_examples 'calling super method if exist'
		end

		describe '#transform_values!' do
			subject { init_hash.transform_values! { |value| value * 10 } }

			it { is_expected.to eq(a: 10, b: 20, c: 30) }
			it { is_expected.to be init_hash }

			include_examples 'calling super method if exist'
		end
	end
end
