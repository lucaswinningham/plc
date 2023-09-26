# frozen_string_literal: true

require 'plc/instructions/bits/output_energize'

require 'plc/instructions/bits/latches'

module Plc
  module Instructions
    module Bits
      def output_energize(*args, **kwargs, &block)
        OutputEnergize.new(*args, **kwargs, &block)
      end

      alias ote output_energize

      include Latches
    end
  end
end
