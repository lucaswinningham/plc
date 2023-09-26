# frozen_string_literal: true

require 'plc/instructions/bits'
require 'plc/instructions/timers'

module Plc
  module Instructions
    extend Bits
    extend Timers
  end
end
