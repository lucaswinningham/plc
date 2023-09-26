# frozen_string_literal: true

module Plc
  module DataTypes
    class Bit
      def initialize(&block)
        @block = block || proc { false }
      end

      def clear
        set false
      end

      def set(bool = true)
        bool.tap { @block = proc { bool } }
      end

      def clear?
        !set?
      end

      def set?
        value == true
      end

      def !
        Bit.new { !value }
      end

      def *(other)
        Bit.new { value && other.value }
      end

      def +(other)
        Bit.new { value || other.value }
      end

      def value
        block.call == true
      end

      private

      attr_reader :block
    end
  end
end
