# CliSpinnable

[![Gem Version](https://badge.fury.io/rb/cli_spinnable.svg)](https://badge.fury.io/rb/cli_spinnable)
[![Build Status](https://travis-ci.org/maicher/cli_spinnable.svg?branch=master)](https://travis-ci.org/maicher/cli_spinnable)
[![Code Climate](https://codeclimate.com/github/maicher/cli_spinnable/badges/gpa.svg)](https://codeclimate.com/github/maicher/cli_spinnable)
[![Test Coverage](https://codeclimate.com/github/maicher/cli_spinnable/badges/coverage.svg)](https://codeclimate.com/github/maicher/cli_spinnable/coverage)

CliSpinnable, a module that enriches ruby command line interface with rotating spinner, check mark (&#10003;) and and fail mark (&#215;).

## Dependencies

  * Ruby >= 2.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cli_spinnable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cli_spinnable

## How to use

1. Mix-in CliSpinnable module into YourClass

        class YourClass
          include CliSpinnable
        
2. Call `with_spinner` inside `your_method` providing a block         
        
          def your_method
            with_spinner do |cli|
              # ...
            end
          end

3. Use `#print` and `#tick` methods
        
        with_spinner do |cli|
          cli.print 'Downloading something'
          sleep 1 # some long operation
          cli.print '...downloaded 1MB'
          cli.tick
          cli.print 'Processing data'
          sleep 1 # other long operation
          cli.tick
        end
        
4. If operation will fail (exception raised within the block), &#215; will be printed

        with_spinner do |cli|
          cli.print 'Trying to do something that can fail'
          1 / 0 # raise Error
          cli.tick # you will not see the tick
        end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maicher/cli_spinnable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
