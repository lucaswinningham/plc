# frozen_string_literal: true

require 'plc/instructions/bits'
require 'plc/instructions/bits/output_energize'

RSpec.describe Plc::Instructions::Bits do
  subject { Class.new { extend Plc::Instructions::Bits } }

  describe '::output_energize' do
    it 'instantiates an OutputEnergize' do
      ote = double 'OutputEnergize'
      expect(Plc::Instructions::Bits::OutputEnergize).to receive(:new) { ote }

      expect(subject.output_energize).to be ote
    end

    describe 'aliases' do
      it 'ote' do
        expect(subject.methods(:ote)).to eq subject.methods(:output_energize)
      end
    end
  end
end
