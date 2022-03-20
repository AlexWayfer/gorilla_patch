# frozen_string_literal: true

describe GorillaPatch::ModuleParent do
	using described_class

	describe Module, '#module_parent_name' do
		subject { module_const.module_parent_name }

		context 'when module is nested' do
			let(:module_const) { GorillaPatch::Namespace }

			it { is_expected.to eq 'GorillaPatch' }
		end

		context 'when module is top-level' do
			let(:module_const) { GorillaPatch }

			it { is_expected.to be_nil }
		end

		context 'without name' do
			let(:module_const) { described_class.new }

			it { is_expected.to be_nil }
		end
	end

	describe Module, '#module_parent' do
		subject { module_const.module_parent }

		context 'when module is nested' do
			let(:module_const) { GorillaPatch::Namespace }

			it { is_expected.to eq GorillaPatch }
		end

		context 'when module is top-level' do
			let(:module_const) { GorillaPatch }

			it { is_expected.to eq Object }
		end

		context 'without name' do
			let(:module_const) { described_class.new }

			it { is_expected.to eq Object }
		end
	end
end
