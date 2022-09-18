require "test_helper"
require "input_parsers/world"

module InputParsers
  class WorldTest < Minitest::Test
    def test_empty_string
      input_string = ""

      assert_raises { InputParsers::World.new(input_string) }
    end

    def test_character_string
      input_string = "M N"

      assert_raises { InputParsers::World.new(input_string) }
    end

    def test_extra_characters_string
      input_string = "(4, 8)"

      assert_raises { InputParsers::World.new(input_string) }
    end

    def test_no_space_string
      input_string = "48"

      assert_raises { InputParsers::World.new(input_string) }
    end

    def test_single_digits_string
      max_x = 4
      max_y = 8
      input_string = "#{max_x} #{max_y}"

      world_input = InputParsers::World.new(input_string)

      assert_equal max_x, world_input.max_x
      assert_equal max_y, world_input.max_y
    end

    def test_multiple_digits_string
      max_x = 44
      max_y = 88
      input_string = "#{max_x} #{max_y}"

      world_input = InputParsers::World.new(input_string)

      assert_equal max_x, world_input.max_x
      assert_equal max_y, world_input.max_y
    end

    def test_new_line_string
      max_x = 4
      max_y = 8
      input_string = "#{max_x} #{max_y}\n"

      world_input = InputParsers::World.new(input_string)

      assert_equal max_x, world_input.max_x
      assert_equal max_y, world_input.max_y
    end
  end
end
