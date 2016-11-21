$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'cli_spinnable'

module Cli
  extend CliSpinnable
end

puts 'HAPPY RUN (should succeed):'
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.print '...downloaded 1MB'
  cli.tick
  cli.print 'Processing data'
  sleep 1
  cli.tick
end

puts 'SAD RUN (should fail):'
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.print '...downloaded 1MB'
  cli.tick
  cli.print 'Processing data'
  sleep 1
  1 / 0    # produces exception
  cli.tick # this will not be reached
end
