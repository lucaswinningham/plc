# frozen_string_literal: true

require 'plc/instructions/bits/latches/output_latch'
require 'plc/instructions/bits/latches/output_unlatch'

module Plc
  module Instructions
    module Bits
      module Latches
        # def output_latch(*args, **kwargs, &block)
        def output_latch
          # OutputLatch.new(*args, **kwargs, &block)
          puts 'Plc::Instructions::Bits::Latches.output_latch'
        end
      end
    end
  end
end
