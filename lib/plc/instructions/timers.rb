# frozen_string_literal: true

require 'plc/instructions/timers/timer_on'
require 'plc/instructions/timers/timer_off'

module Plc
  module Instructions
    module Timers
      def timer_on(*args, **kwargs, &block)
        TimerOn.new(*args, **kwargs, &block)
      end

      alias ton timer_on

      def timer_off(*args, **kwargs, &block)
        TimerOff.new(*args, **kwargs, &block)
      end

      alias tof timer_off
    end
  end
end
