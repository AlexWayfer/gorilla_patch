# frozen_string_literal: true

require 'spec_helper'

describe GorillaPatch::Namespace do
	using GorillaPatch::Namespace

	describe String, '#demodulize' do
		it { expect('Foo::Bar::Baz'.demodulize).to eq 'Baz' }
		it { expect('Foo'.demodulize).to eq 'Foo' }
	end

	describe Module, '#demodulize' do
		it { expect(GorillaPatch::Namespace.demodulize).to eq 'Namespace' }
		it { expect(GorillaPatch.demodulize).to eq 'GorillaPatch' }
	end

	describe Class, '#demodulize' do
		class Class
			private

			def demodulize; end
		end

		module GorillaPatch; class NamespaceClass; end; end

		using GorillaPatch::Namespace

		it do
			expect(GorillaPatch::NamespaceClass.demodulize).to eq 'NamespaceClass'
		end
	end
end
