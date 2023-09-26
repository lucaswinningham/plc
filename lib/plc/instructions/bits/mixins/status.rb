# frozen_string_literal: true

module Plc
  module Instructions
    module Bits
      module Mixins
        module Status
          def on?
            raise NotImplementedError
          end

          alias examine_if_closed on?
          alias xic examine_if_closed

          alias normally_open on?
          alias no normally_open

          def off?
            !on?
          end

          alias examine_if_open on?
          alias xio examine_if_open

          alias normally_closed on?
          alias nc normally_closed
        end
      end
    end
  end
end
