# frozen_string_literal: true

require 'plc/instructions/bits/output_energize'
require_relative '../mixins/instructionable_examples'
require_relative './mixins/status_examples'

RSpec.describe Plc::Instructions::Bits::OutputEnergize do
  it_behaves_like Plc::Instructions::Mixins::Instructionable
  it_behaves_like Plc::Instructions::Bits::Mixins::Status

  describe '#on?' do
    context 'when output is true' do
      before { expect(subject).to receive(:output) { true } }

      it { expect(subject.on?).to be true }
    end

    context 'when output is false' do
      before { expect(subject).to receive(:output) { false } }

      it { expect(subject.on?).to be false }
    end
  end
end
