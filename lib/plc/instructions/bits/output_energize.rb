# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'
# require 'plc/instructions/bits/mixins/status'

module Plc
  module Instructions
    module Bits
      class OutputEnergize
        include Instructions::Mixins::Instructionable

        def initialize(bit, &block)
          initialize_as_bit_instruction(bit, &block)
        end

        # include Mixins::Status

        # def on?
        #   output == true
        # end

        private

        def after_plc_scan
          bit.set scan_result.value
        end
      end
    end
  end
end
