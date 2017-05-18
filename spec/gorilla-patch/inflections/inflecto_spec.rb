# frozen_string_literal: true

require 'spec_helper'

describe 'GorillaPatch::Inflections.from_inflecto' do
	using GorillaPatch::Inflections.from_inflecto

	describe String do
		let(:string) { 'GorillaPatch' }

		it { expect(string.camelize).to be_truthy }
		it { expect(string.constantize).to be_truthy }
		it { expect(string.dasherize).to be_truthy }
		it { expect(string.demodulize).to be_truthy }
		it { expect(string.humanize).to be_truthy }
		it { expect(string.pluralize).to be_truthy }
		it { expect(string.singularize).to be_truthy }
		it { expect(string.underscore).to be_truthy }
	end
end
