module CliSpinnable
  class Writer
    class Error < StandardError; end

    REFRESH_DELAY_IN_SECONDS = 0.1

    def initialize(output, line)
      @output = output
      @line = line
      @queue = Queue.new
      @session = start_session
    end

    def print(str)
      push(:sign=, :spin)
      push(:<<, str)
      self
    end

    def tick
      push(:sign=, :tick)
      push(:newline=, true)
      push(:str=, '')
      self
    end

    def failure
      push(:sign=, :fail)
      push(:newline=, true)
      self
    end

    def finalize
      push(:sign=, :blank)
      push(:str=, '')
      finalize_session
      self
    end

    private

    attr_reader :line, :queue, :session, :output

    def push(attr, val)
      raise Error, 'Session finalized' unless session.status
      queue.push([attr, val])
    end

    def start_session
      Thread.new do
        loop do
          loop do
            output.write reload_line.to_s_resetting_newline
            break if queue.empty?
          end
          break if Thread.current[:finalize]
          sleep REFRESH_DELAY_IN_SECONDS
        end
      end
    end

    def reload_line
      line.public_send(*queue.pop) unless queue.empty?
      line
    end

    def finalize_session
      session[:finalize] = true
      session.join
    end
  end
end
