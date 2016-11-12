module CliSpinnable
  class Line
    class Error < StandardError; end

    CARRIAGE_RETURN = "\r".freeze
    NEWLINE = "\n".freeze

    attr_accessor :newline
    attr_reader :str, :sign

    def initialize(str = nil, sign = nil, newline = nil)
      self.str = str
      @sign = Sign.new(sign)
      @newline = newline
    end

    def sign=(sym)
      sign.sign = sym
    end

    def <<(str)
      self.str << ensure_single_line(String(str))
    end

    def str=(str)
      @str = ensure_single_line(String(str))
    end

    def to_s_resetting_newline
      [CARRIAGE_RETURN, sign, str, newline_with_reset].join
    end

    private

    def ensure_single_line(str)
      raise Error, 'Multiline strings not allowed' if str.include?(NEWLINE)
      str
    end

    def newline_with_reset
      return unless newline
      self.newline = false
      NEWLINE
    end
  end
end
