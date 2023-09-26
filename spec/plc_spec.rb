# frozen_string_literal: true

require 'plc'
require 'plc/scan'

RSpec.describe Plc do
  subject { described_class }

  it 'has a version number' do
    expect(Plc::VERSION).not_to be nil
  end

  describe '::scan' do
    it 'invokes ::call on Plc::Scan' do
      expect(Plc::Scan).to receive(:call)

      subject.scan
    end
  end
end
