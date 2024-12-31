# frozen_string_literal: true

describe 'GorillaPatch::Inflections.from_dry_inflector' do
	using GorillaPatch::Inflections.from_dry_inflector

	describe String do
		let(:string) { 'GorillaPatch' }

		it { expect(string.camelize).to eq 'GorillaPatch' }
		it { expect(string.constantize).to eq GorillaPatch }
		it { expect(string.dasherize).to eq 'GorillaPatch' }
		it { expect(string.demodulize).to eq 'GorillaPatch' }
		it { expect(string.humanize).to eq 'Gorillapatch' }
		it { expect(string.pluralize).to eq 'GorillaPatches' }
		it { expect(string.singularize).to eq 'GorillaPatch' }
		it { expect(string.underscore).to eq 'gorilla_patch' }
	end
end
