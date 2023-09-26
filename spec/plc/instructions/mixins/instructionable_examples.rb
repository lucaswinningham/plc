# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'

RSpec.shared_examples Plc::Instructions::Mixins::Instructionable do
  describe '#initialize_as_instruction' do
    context 'given no block' do
      it 'saves a default block as #input that returns false when invoked' do
        subject.initialize_as_instruction
        expect(subject.input.call).to be false
      end
    end

    context 'given a block' do
      let(:val) { 'val' }
      before { subject.initialize_as_instruction { val } }

      it 'saves block as #input' do
        expect(subject.input.call).to be val
      end
    end

    it 'sets #output to false' do
      subject.instance_variable_set(:@output, nil)
      expect { subject.initialize_as_instruction { true } }.to change { subject.output }.to false

      subject.instance_variable_set(:@output, true)
      expect { subject.initialize_as_instruction { true } }.to change { subject.output }.to false
    end

    it 'subscribes to Plc::Scan' do
      expect(Plc::Scan).to receive(:subscribe).with(subject)

      subject.initialize_as_instruction
    end
  end

  describe '#+' do
  end

  describe '#*' do
  end
end
