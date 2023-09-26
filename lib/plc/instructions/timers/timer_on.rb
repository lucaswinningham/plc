# frozen_string_literal: true

require 'plc/instructions/mixins/instructionable'
require 'plc/instructions/timers/mixins/timerable'

module Plc
  module Instructions
    module Timers
      class TimerOn
        include Instructions::Mixins::Instructionable
        include Mixins::Timerable

        def initialize(*args, **kwargs, &block)
          initialize_as_instruction(*args, **kwargs, &block)
          initialize_as_timer(*args, **kwargs, &block)
        end

        private

        def accumulate?
          output == true
        end
      end
    end
  end
end
