require "test_helper"
require "input_parsers/robot"

module InputParsers
  class RobotTest < Minitest::Test
    def test_empty_string
      input_string = ""

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_no_brackets_string
      input_string = "4, 8, N F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_no_commas_string
      input_string = "(4 8 N) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_no_numbers_string
      input_string = "(N) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_letters_for_numbers_string
      input_string = "(N, N, N) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_extra_characters_string
      input_string = "(4-!, 8./, N) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_no_spaces_string
      input_string = "(4,8,N) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_not_nesw_string
      input_string = "(4, 8, X) F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_no_middle_space_string
      input_string = "(4, 8, N)F"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_not_flr_string
      input_string = "(4, 8, N) X"

      assert_raises { InputParsers::Robot.new(input_string) }
    end

    def test_single_digits_string
      x = 4
      y = 8
      input_string = "(#{x}, #{y}, N) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal x, robot_input.x
      assert_equal y, robot_input.y
    end

    def test_multiple_digits_string
      x = 44
      y = 88
      input_string = "(#{x}, #{y}, N) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal x, robot_input.x
      assert_equal y, robot_input.y
    end

    def test_north_string
      orientation = "N"
      input_string = "(4, 8, #{orientation}) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal orientation, robot_input.orientation
    end

    def test_east_string
      orientation = "E"
      input_string = "(4, 8, #{orientation}) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal orientation, robot_input.orientation
    end

    def test_south_string
      orientation = "S"
      input_string = "(4, 8, #{orientation}) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal orientation, robot_input.orientation
    end

    def test_west_string
      orientation = "W"
      input_string = "(4, 8, #{orientation}) F"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal orientation, robot_input.orientation
    end

    def test_single_movement_sequence_string
      movement_sequence = "F"
      input_string = "(4, 8, N) #{movement_sequence}"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal movement_sequence, robot_input.movement_sequence
    end

    def test_multiple_movement_sequence_string
      movement_sequence = "FLRF"
      input_string = "(4, 8, N) #{movement_sequence}"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal movement_sequence, robot_input.movement_sequence
    end

    def test_new_line_string
      x = 4
      y = 8
      orientation = "N"
      movement_sequence = "F"
      input_string = "(#{x}, #{y}, #{orientation}) #{movement_sequence}\n"

      robot_input = InputParsers::Robot.new(input_string)

      assert_equal x, robot_input.x
      assert_equal y, robot_input.y
      assert_equal orientation, robot_input.orientation
      assert_equal movement_sequence, robot_input.movement_sequence
    end
  end
end
