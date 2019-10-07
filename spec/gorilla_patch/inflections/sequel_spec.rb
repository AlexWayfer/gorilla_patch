# frozen_string_literal: true

describe 'GorillaPatch::Inflections.from_sequel' do
	using GorillaPatch::Inflections.from_sequel

	describe String do
		let(:string) { 'GorillaPatch' }

		it { expect(string.camelize).to be_truthy }
		it { expect(string.constantize).to be_truthy }
		it { expect(string.demodulize).to be_truthy }
		it { expect(string.pluralize).to be_truthy }
		it { expect(string.singularize).to be_truthy }
		it { expect(string.underscore).to be_truthy }
	end
end
