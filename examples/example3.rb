$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'cli_spinnable'

module Cli
  extend CliSpinnable
end

# Close the block before reading from input.

# Good:
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
end

print 'Enter name: '
name = gets.chomp

Cli.with_spinner do |cli|
  cli.print "Doing something with name #{name}"
  sleep 1
  cli.tick
end

# Bad:
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick

  print 'Enter name: '
  name = gets.chomp

  cli.print "Doing something with name #{name}"
  sleep 1
  cli.tick
end
