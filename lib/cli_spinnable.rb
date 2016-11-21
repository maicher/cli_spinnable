require 'cli_spinnable/version'
require 'cli_spinnable/cli_spinnable_error'
require 'cli_spinnable/line/colourable_string'
require 'cli_spinnable/line/sign'
require 'cli_spinnable/line'
require 'cli_spinnable/writer'

module CliSpinnable
  module Methods
    def with_spinner
      writer = Writer.new(STDOUT, Line.new)
      yield writer
      writer.finalize
      self
    rescue CliSpinnableError => e
      raise e
    rescue StandardError => e
      writer.failure
      writer.finalize
      raise e
    end
  end

  include Methods

  class << self
    include Methods
  end
end
