$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'cli_spinnable'

module Cli
  extend CliSpinnable
end

# Don't print multiline strings inside `with_spinner` block.

# Good:
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
end

print "Multiline\nstring"

# Bad:
Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
  print "Multiline\nstring"
end
s
# Bad:

Cli.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
  cli.print "Multiline\nstring"
end
