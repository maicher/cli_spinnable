$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'cli_spinnable'

class Foo
  include CliSpinnable

  def call
    puts 'HAPPY RUN (ending with success):'
    with_spinner do |cli|
      cli.print 'Downloading something'
      sleep 1
      cli.print '...downloaded 1MB'
      cli.tick
      cli.print 'Processing data'
      sleep 1
      cli.tick
    end

    puts 'SAD RUN (ending with fail):'
    with_spinner do |cli|
      cli.print 'Downloading something'
      sleep 1
      cli.print '...downloaded 1MB'
      cli.tick
      cli.print 'Processing data'
      sleep 1
      1 / 0
      cli.tick
    end
  end
end

Foo.new.call
