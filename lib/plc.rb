# frozen_string_literal: true

# require 'plc/configuration'
require 'plc/instructions'
require 'plc/scan'
require 'plc/version'

module Plc
  class << self
    def scan
      Scan.call
    end
    # def configure
    #   yield configuration
    # end

    # private

    # def configuration
    #   @configuration ||= Configuration.new
    # end
  end
end
