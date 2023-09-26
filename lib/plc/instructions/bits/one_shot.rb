# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'
require 'plc/instructions/bits/mixins/status'

module Plc
  module Instructions
    module Bits
      class OneShot
        include Instructions::Mixins::Instructionable

        def initialize(*args, **kwargs, &block)
          initialize_as_instruction(*args, **kwargs, &block)
        end

        include Mixins::Status

        def on?
          previous_output == false && output == true
        end

        private

        attr_reader :previous_output

        def before_plc_scan
          @previous_output = output
        end
      end
    end
  end
end
