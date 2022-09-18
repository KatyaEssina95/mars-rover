module InputParsers
  class World
    attr_reader :input_string, :max_x, :max_y

    def initialize(input_string)
      @input_string = input_string
      validate_input_string!
      @max_x, @max_y = parse_input_string
    end

    private

    def validate_input_string!
      unless input_string.match(/[0-9]+ [0-9]+/)
        raise "World description: #{input_string} doesn't match required format. " \
          "World dimensions must be described by a string of format `number number`."
      end
    end

    def parse_input_string
      input_string.strip.split(" ").map(&:to_i)
    end
  end
end
