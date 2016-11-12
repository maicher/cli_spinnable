module CliSpinnable
  class Line
    class Sign
      using ColourableString

      class Error < StandardError; end

      SPIN = %w(- \\ | /).freeze
      TICK = "\u2713".green.freeze
      FAIL = "\u00d7".red.freeze
      BLANK = ''.freeze

      AVAILABLE_SIGNS = %i(spin tick fail blank).freeze

      def initialize(sign = nil)
        @sign = sign || :blank
      end

      def sign=(sign)
        raise Error, "Unavailable sign: #{sign || 'nil'}" unless AVAILABLE_SIGNS.include?(sign)
        @sign = sign
        self
      end

      def to_s
        send(sign) + separator
      end

      private

      attr_reader :sign

      def separator
        sign == :blank ? '' : ' '
      end

      def spin
        spinner_enum.next
      end

      def tick
        TICK
      end

      def fail
        FAIL
      end

      def blank
        BLANK
      end

      def spinner_enum
        @spinner_enum ||= SPIN.cycle
      end
    end
  end
end
