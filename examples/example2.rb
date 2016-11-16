$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'cli_spinnable'

module Foo
  extend CliSpinnable
end

puts 'HAPPY RUN (ending with success):'
Foo.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.print '...downloaded 1MB'
  cli.tick
  cli.print 'Processing data'
  sleep 1
  cli.tick
end

puts 'SAD RUN (ending with fail):'
Foo.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.print '...downloaded 1MB'
  cli.tick
  cli.print 'Processing data'
  sleep 1
  1 / 0
  cli.tick
end
