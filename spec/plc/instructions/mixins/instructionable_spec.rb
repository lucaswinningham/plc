# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'
require_relative './instructionable_examples'

RSpec.describe Plc::Instructions::Mixins::Instructionable do
  subject { klass.new }

  let(:klass) do
    Class.new do
      include Plc::Instructions::Mixins::Instructionable

      def initialize
        initialize_as_instruction do
          @hooks = [*hooks, 'plc_scan']
          @some_boolean = !@some_boolean
        end
      end

      def hooks
        @hooks ||= []
      end

      def perform_plc_scan
        plc_scan
      end

      private

      def before_plc_scan
        @hooks = [*hooks, 'before_plc_scan']
      end

      def after_plc_scan
        @hooks = [*hooks, 'after_plc_scan']
      end
    end
  end

  it_behaves_like Plc::Instructions::Mixins::Instructionable

  describe '#plc_scan' do
    it 'sets #output to result of block' do
      expect { subject.perform_plc_scan }.to change { subject.output }.to(true)
      expect { subject.perform_plc_scan }.to change { subject.output }.to(false)
    end

    it 'calls hooks in correct order' do
      subject.perform_plc_scan

      expect(subject.hooks).to eq %w[before_plc_scan plc_scan after_plc_scan]
    end
  end
end
