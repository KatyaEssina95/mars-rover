module InputParsers
  class Robot
    attr_reader :input_string, :x, :y, :orientation, :movement_sequence

    def initialize(input_string)
      @input_string = input_string
      validate_input_string!
      position_string, @movement_sequence = parse_input_string
      @x, @y, @orientation = parse_position_string(position_string)
    end

    private

    def validate_input_string!
      unless input_string.match(/\([0-9]+, [0-9]+, [NESW]\) [FLR]/)
        raise "Robot description: #{input_string} doesn't match required format. " \
          "Robot must be described by a string of format `(number, number, N/E/S/W) F/L/R`."
      end
    end

    def parse_input_string
      input_string.strip.tr('(', '').split(") ")
    end

    def parse_position_string(string)
      position_array = string.split(", ")
      # Convert coordinates to integers
      position_array[0] = position_array[0].to_i
      position_array[1] = position_array[1].to_i
      position_array
    end
  end
end
