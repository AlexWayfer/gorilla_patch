# frozen_string_literal: true

describe GorillaPatch::Slice do
	using GorillaPatch::Slice

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
		let(:sliced_keys) { %i[a b] }

		shared_examples 'calling super method if exist' do
			if RUBY_VERSION >= '2.5'
				it do
					if subject.is_a?(HashWithSetterCounter)
						expect(subject.setter_counter).to be_nil
					else
						is_expected.to be_instance_of(Hash)
					end
				end
			else
				it { expect(subject.setter_counter).to eq sliced_keys.size }
			end
		end

		describe '#slice' do
			subject { init_hash.slice(*sliced_keys) }

			it { is_expected.to eq(a: 1, b: 2) }
			it { is_expected.not_to be init_hash }

			include_examples 'calling super method if exist'
		end

		describe '#slice!' do
			subject { init_hash.slice!(*sliced_keys) }

			it { is_expected.to eq(c: 3) }
			it { is_expected.not_to be init_hash }
			it do
				subject
				expect(init_hash).to eq(a: 1, b: 2)
			end
		end

		describe '#slice_reverse!' do
			subject { init_hash.slice_reverse!(*sliced_keys) }

			it { is_expected.to eq(a: 1, b: 2) }
			it { is_expected.not_to be init_hash }
			it do
				subject
				expect(init_hash).to eq(c: 3)
			end
		end
	end
end
