# frozen_string_literal: true

require 'plc/scan'

module Plc
  module Instructions
    module Timers
      module Mixins
        module Timerable
          attr_reader :input
          attr_reader :acc, :pre

          def initialize_as_timer(*_args, **kwargs)
            @acc = kwargs[:acc] || 0
            @pre = kwargs[:pre] || 0
          end

          def done?
            acc > pre
          end

          private

          def after_plc_scan
            if accumulate?
              accumulate unless done?
            else
              reset_accumulation
            end
          end

          def accumulate?
            raise NotImplementedError
          end

          def accumulate
            @acc += Scan.ms_since_last_scan
          end

          def reset_accumulation
            @acc = 0
          end
        end
      end
    end
  end
end
