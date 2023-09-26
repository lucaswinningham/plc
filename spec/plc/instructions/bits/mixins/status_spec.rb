# frozen_string_literal: true

require 'plc/instructions/bits/mixins/status'
require_relative './status_examples'

RSpec.describe Plc::Instructions::Bits::Mixins::Status do
  subject { klass.new }

  let(:klass) do
    Class.new do
      include Plc::Instructions::Bits::Mixins::Status

      def on?; end
    end
  end

  it_behaves_like Plc::Instructions::Bits::Mixins::Status

  describe '#on?' do
    context 'when not implemented' do
      let(:klass) { Class.new { include Plc::Instructions::Bits::Mixins::Status } }

      it { expect { subject.on? }.to raise_error NotImplementedError }
    end
  end
end
