# frozen_string_literal: true

describe GorillaPatch::Inflections do
	using GorillaPatch::Inflections

	describe '.acronym' do
		it 'default acronyms are sorted' do
			expect(described_class.acronyms).to eq described_class.acronyms.sort
		end

		it 'remembers new acronym' do
			described_class.acronyms.push 'HMAC'
			expect('hmac'.camelize).to eq('HMAC')
			expect('Hmac'.camelize).to eq('HMAC')
		end

		it 'works with not only capsed' do
			described_class.acronyms.push 'McDonald'
			expect('McDonald'.underscore).to eq('mcdonald')
			expect('API::McDonald'.underscore).to eq('api/mcdonald')
			expect('McDonaldCompany'.underscore).to eq('mcdonald_company')
			expect('mcdonald'.camelize).to eq('McDonald')
		end
	end

	describe String do
		describe '#underscore' do
			it { expect('PascalCase'.underscore).to eq 'pascal_case' }
			it { expect('ABBRPascalCase'.underscore).to eq 'abbr_pascal_case' }
			it { expect('Foo::PascalCase'.underscore).to eq 'foo/pascal_case' }
			it { expect('camelCase'.underscore).to eq 'camel_case' }
			it { expect('kebab-case'.underscore).to eq 'kebab_case' }
			it { expect('snake_case'.underscore).to eq 'snake_case' }
			it { expect('foo/snake_case').to eq 'foo/snake_case' }
			it { expect('JSON'.underscore).to eq('json') }
			it { expect('HTTP::Get'.underscore).to eq('http/get') }
			it { expect('HTTPError'.underscore).to eq('http_error') }
			it { expect('ClientHTTPError'.underscore).to eq('client_http_error') }
			it { expect('Paid'.underscore).to eq('paid') }
			it { expect('DateTime'.underscore).to eq('datetime') }
		end

		describe '#camelize' do
			it { expect('PascalCase'.camelize).to eq 'PascalCase' }
			it { expect('ABBRPascalCase'.camelize).to eq 'ABBRPascalCase' }
			it { expect('Foo::PascalCase'.camelize).to eq 'Foo::PascalCase' }
			it { expect('camelCase'.camelize).to eq 'CamelCase' }
			it { expect('kebab-case'.camelize).to eq 'KebabCase' }
			it { expect('snake_case'.camelize).to eq 'SnakeCase' }
			it { expect('foo/snake_case'.camelize).to eq 'Foo::SnakeCase' }
			it { expect('ip'.camelize).to eq('IP') }
			it { expect('shipper'.camelize).to eq('Shipper') }
			it { expect('HTTP'.camelize).to eq('HTTP') }
			it { expect('application_REST'.camelize).to eq('ApplicationREST') }
			it { expect('Api'.camelize).to eq('API') }
			it { expect('http/get'.camelize).to eq('HTTP::Get') }
			it { expect('http_error'.camelize).to eq('HTTPError') }
			it { expect('client_http_error'.camelize).to eq('ClientHTTPError') }
			it { expect('paid'.camelize).to eq('Paid') }
			it { expect('datetime'.camelize).to eq('DateTime') }
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
