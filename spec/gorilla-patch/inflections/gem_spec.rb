# frozen_string_literal: true

describe GorillaPatch::Inflections do
	using GorillaPatch::Inflections

	describe String do
		describe '#underscore' do
			it { expect('PascalCase'.underscore).to eq 'pascal_case' }
			it { expect('ABBRPascalCase'.underscore).to eq 'abbr_pascal_case' }
			it { expect('Foo::PascalCase'.underscore).to eq 'foo/pascal_case' }
			it { expect('camelCase'.underscore).to eq 'camel_case' }
			it { expect('kebab-case'.underscore).to eq 'kebab_case' }
			it { expect('snake_case'.underscore).to eq 'snake_case' }
			it { expect('foo/snake_case').to eq 'foo/snake_case' }
		end

		describe '#camelize' do
			it { expect('PascalCase'.camelize).to eq 'PascalCase' }
			it { expect('ABBRPascalCase'.camelize).to eq 'ABBRPascalCase' }
			it { expect('Foo::PascalCase'.camelize).to eq 'Foo::PascalCase' }
			it { expect('camelCase'.camelize).to eq 'CamelCase' }
			it { expect('kebab-case'.camelize).to eq 'KebabCase' }
			it { expect('snake_case'.camelize).to eq 'SnakeCase' }
			it { expect('foo/snake_case'.camelize).to eq 'Foo::SnakeCase' }
		end
	end

	describe Module do
		describe '#underscore' do
			it do
				expect(GorillaPatch::Inflections.underscore)
					.to eq 'gorilla_patch/inflections'
			end
		end
	end
end
