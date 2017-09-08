# frozen_string_literal: true

describe GorillaPatch::Namespace do
	using GorillaPatch::Namespace

	describe String, '#demodulize' do
		it { expect('Foo::Bar::Baz'.demodulize).to eq 'Baz' }
		it { expect('Foo'.demodulize).to eq 'Foo' }
		it { expect('::Foo'.demodulize).to eq 'Foo' }
		it { expect(''.demodulize).to eq '' }
	end

	describe Module, '#demodulize' do
		it { expect(GorillaPatch::Namespace.demodulize).to eq 'Namespace' }
		it { expect(GorillaPatch.demodulize).to eq 'GorillaPatch' }

		it 'should work for class without name' do
			expect { Module.new.demodulize }.to_not raise_error
		end
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

	describe String, '#deconstantize' do
		it { expect('Foo::Bar::Baz'.deconstantize).to eq 'Foo::Bar' }
		it { expect('Foo::Bar'.deconstantize).to eq 'Foo' }
		it { expect('::Foo::Bar'.deconstantize).to eq '::Foo' }
		it { expect('Foo'.deconstantize).to eq '' }
		it { expect('::Foo'.deconstantize).to eq '' }
		it { expect(''.deconstantize).to eq '' }
	end

	describe Module, '#deconstantize' do
		it { expect(GorillaPatch::Namespace.deconstantize).to eq 'GorillaPatch' }
		it { expect(GorillaPatch.deconstantize).to eq '' }

		it 'should work for class without name' do
			expect { Module.new.deconstantize }.to_not raise_error
		end
	end
end
