# frozen_string_literal: true

describe GorillaPatch::Namespace do
	using described_class

	describe String, '#demodulize' do
		it { expect('Foo::Bar::Baz'.demodulize).to eq 'Baz' }
		it { expect('Foo'.demodulize).to eq 'Foo' }
		it { expect('::Foo'.demodulize).to eq 'Foo' }
		it { expect(''.demodulize).to eq '' }
	end

	describe Module, '#demodulize' do
		it { expect(GorillaPatch::Namespace.demodulize).to eq 'Namespace' }
		it { expect(GorillaPatch.demodulize).to eq 'GorillaPatch' }

		it 'works for class without name' do
			expect { described_class.new.demodulize }.not_to raise_error
		end
	end

	describe Class, '#demodulize' do
		## Impossible to use `using` right after `stub_const` :angry:
		# rubocop:disable RSpec/LeakyConstantDeclaration
		class Class
			private

			def demodulize; end
		end

		module GorillaPatch; class NamespaceClass; end; end

		using GorillaPatch::Namespace
		# rubocop:enable RSpec/LeakyConstantDeclaration

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

		it 'works for class without name' do
			expect { described_class.new.deconstantize }.not_to raise_error
		end
	end
end
