require 'cli_spinnable/version'
require 'cli_spinnable/line/colourable_string'
require 'cli_spinnable/line/sign'
require 'cli_spinnable/line'
require 'cli_spinnable/writer'

module CliSpinnable
  def with_spinner
    writer = Writer.new(STDOUT, Line.new)
    yield writer
    writer.finalize
    self
  rescue CliSpinnable::Writer::Error,
         CliSpinnable::Line::Sign::Error,
         CliSpinnable::Line::Error => e
    raise e
  rescue StandardError => e
    writer.failure
    writer.finalize
    raise e
  end
end
