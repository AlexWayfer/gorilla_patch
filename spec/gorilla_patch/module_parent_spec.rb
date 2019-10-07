# frozen_string_literal: true

describe GorillaPatch::ModuleParent do
	using GorillaPatch::ModuleParent

	describe Module, '#module_parent_name' do
		subject { module_const.module_parent_name }

		context 'nested' do
			let(:module_const) { GorillaPatch::Namespace }

			it { is_expected.to eq 'GorillaPatch' }
		end

		context 'top-level' do
			let(:module_const) { GorillaPatch }

			it { is_expected.to eq nil }
		end

		context 'without name' do
			let(:module_const) { Module.new }

			it { is_expected.to eq nil }
		end
	end

	describe Module, '#module_parent' do
		subject { module_const.module_parent }

		context 'nested' do
			let(:module_const) { GorillaPatch::Namespace }

			it { is_expected.to eq GorillaPatch }
		end

		context 'top-level' do
			let(:module_const) { GorillaPatch }

			it { is_expected.to eq Object }
		end

		context 'without name' do
			let(:module_const) { Module.new }

			it { is_expected.to eq Object }
		end
	end
end
