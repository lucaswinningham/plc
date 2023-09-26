# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'

module Plc
  module Instructions
    module Bits
      module Mixins
        module BitInstructionable
          include Instructions::Mixins::Instructionable
          # attr_reader :input, :output

          def initialize_as_bit_instruction(bit, &block)
            initialize_as_instruction(&block)
            @bit = bit
          end
          
          private

          attr_reader :bit
        end
      end
    end
  end
end
