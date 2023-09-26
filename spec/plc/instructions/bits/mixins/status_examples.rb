# frozen_string_literal: true

require 'plc/instructions/bits/mixins/status'

RSpec.shared_examples Plc::Instructions::Bits::Mixins::Status do
  describe '#on?' do
    it do
      expect { subject.on? }.not_to raise_error
    end

    describe 'aliases' do
      it 'examine_if_closed' do
        expect(subject.methods(:examine_if_closed)).to eq subject.methods(:on?)
      end

      it 'xic' do
        expect(subject.methods(:xic)).to eq subject.methods(:on?)
      end

      it 'normally_open' do
        expect(subject.methods(:normally_open)).to eq subject.methods(:on?)
      end

      it 'no' do
        expect(subject.methods(:no)).to eq subject.methods(:on?)
      end
    end
  end

  describe '#off?' do
    it 'is the negative of #on?' do
      expect(subject).to receive(:on?) { true }
      expect(subject.off?).to be false

      expect(subject).to receive(:on?) { false }
      expect(subject.off?).to be true
    end

    describe 'aliases' do
      it 'examine_if_open' do
        expect(subject.methods(:examine_if_open)).to eq subject.methods(:on?)
      end

      it 'xio' do
        expect(subject.methods(:xio)).to eq subject.methods(:on?)
      end

      it 'normally_closed' do
        expect(subject.methods(:normally_closed)).to eq subject.methods(:on?)
      end

      it 'nc' do
        expect(subject.methods(:nc)).to eq subject.methods(:on?)
      end
    end
  end
end
