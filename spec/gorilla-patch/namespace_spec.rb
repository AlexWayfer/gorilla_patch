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
end
