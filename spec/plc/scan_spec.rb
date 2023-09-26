# frozen_string_literal: true

require 'plc/scan'

RSpec.describe Plc::Scan do
  subject { described_class }

  let(:subscriber_klass) do
    Class.new do
      private

      def plc_scan; end
    end
  end

  describe '::subscribe' do
    context 'when subscriber responds to ::plc_scan' do
      let(:subscriber) { subscriber_klass.new }

      it do
        expect { subject.subscribe subscriber }.not_to raise_error
      end
    end

    context 'when subscriber does not respond to ::plc_scan' do
      let(:subscriber_klass) { Class.new }
      let(:subscriber) { subscriber_klass.new }

      it do
        expect { subject.subscribe subscriber }.to raise_error Plc::Scan::NotScannable
      end
    end
  end

  describe '::call' do
    context 'after subscription' do
      let(:subscribers) do
        2.times.map do
          subscriber_klass.new.tap do |subscriber|
            subject.subscribe subscriber
          end
        end
      end

      it 'calls #plc_scan on subscribers' do
        subscribers.each { |subscriber| expect(subscriber).to receive(:plc_scan) }

        subject.call
      end
    end
  end

  describe '::ms_since_last_scan' do
    before { subject.reset }

    it 'gives milliseconds since the last scan' do
      now = Time.now

      expect(Time).to receive(:now) { now - 0.5 }
      subject.call

      expect(Time).to receive(:now) { now }
      subject.call

      expect(subject.ms_since_last_scan).to eq 500
    end

    context 'on first scan' do
      it do
        subject.call
        expect(subject.ms_since_last_scan).to eq 0
      end
    end

    context 'on subsequent scans' do
      before { subject.call }

      it do
        subject.call
        expect(subject.ms_since_last_scan).to be > 0
      end
    end
  end
end
