# frozen_string_literal: true

require 'plc/scan'

module Plc
  module Instructions
    module Mixins
      module Instructionable
        attr_reader :input, :scan_result

        def initialize_as_instruction(&block)
          @input = block || proc {}
          @scan_result

          Scan.subscribe self
        end

        private

        def before_plc_scan; end

        def after_plc_scan; end

        def plc_scan
          before_plc_scan
          @scan_result = input.call
          after_plc_scan
        end
      end
    end
  end
end
