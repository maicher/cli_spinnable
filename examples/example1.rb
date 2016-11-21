$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

## This example shows different ways of accessing the `.with_spinner` method.

require 'cli_spinnable'

# 1. Use `CliSpinnable.with_spinner` directly.
CliSpinnable.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
end

# 2. Create own module and extend it with CliSpinnable.
#    This way you will have own namespace for `.with_spinner` method.
module Foo
  extend CliSpinnable
end

Foo.with_spinner do |cli|
  cli.print 'Downloading something'
  sleep 1
  cli.tick
end

# 3. Include CliSpinnable module in own class.
#    This way you can access `with_spinner` method within that class.
class Bar
  include CliSpinnable

  def call
    with_spinner do |cli|
      cli.print 'Downloading something'
      sleep 1
      cli.tick
    end
  end
end

Bar.new.call
