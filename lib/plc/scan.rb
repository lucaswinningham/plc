# frozen_string_literal: true

module Plc
  class Scan
    class NotScannable < StandardError; end

    class << self
      attr_reader :ms_since_last_scan

      def reset
        @last_scanned_at = nil
      end

      def subscribe(subscriber)
        raise NotScannable unless subscriber.respond_to?(:plc_scan, true)

        @subscribers = [*subscribers, subscriber]
      end

      def call
        @last_scanned_at = Time.now.tap do |now|
          @ms_since_last_scan = (now - (last_scanned_at || now)) * 1000
          subscribers.each { |subscriber| subscriber.send :plc_scan }
        end
      end

      private

      attr_reader :last_scanned_at

      def subscribers
        @subscribers ||= []
      end
    end
  end
end
