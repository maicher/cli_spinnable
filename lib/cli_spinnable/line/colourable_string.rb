module CliSpinnable
  class Line
    module ColourableString
      refine String do
        def red
          "\e[31m#{self}\e[0m"
        end

        def green
          "\e[0;32;49m#{self}\e[0m"
        end
      end
    end
  end
end
