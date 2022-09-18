require "test_helper"
require "mars_rover"

class MarsRoverTest < Minitest::Test
  def test_simulate_1
    world_input = InputParsers::World.new("4 8")
    robot_inputs = []
    robot_inputs << InputParsers::Robot.new("(2, 3, E) LFRFF")
    robot_inputs << InputParsers::Robot.new("(0, 2, N) FFLFRFF")

    # Example output
    expected_output = "(4, 4, E)\n(0, 4, W) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(world_input:, robot_inputs:).simulate
    end
  end

  def test_simulate_2
    world_input = InputParsers::World.new("4 8")
    robot_inputs = []
    robot_inputs << InputParsers::Robot.new("(2, 3, N) FLLFR")
    robot_inputs << InputParsers::Robot.new("(1, 0, S) FFRLF")

    # Second example output
    expected_output = "(2, 3, W)\n(1, 0, S) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(world_input:, robot_inputs:).simulate
    end
  end

  def test_simulate_3
    # 4 robots: 3 in range, 1 lost
    # Robot 1 (random): start = (0, 0, E), end = (2, 4, N) movement = FLFRFFLFFLFRF
    # Robot 2 (straight up): start = (2, 2, E), end = (2, 8, N), movement = LFFFFFF
    # Robot 3 (diagonal): start = (1, 0, N), end = (4, 3, N), movement = FRFLFRFLFRFL
    # Robot 4 (lost): start = (0, 1, W), end = (0, 1, W), movement = F

    world_input = InputParsers::World.new("10 10")
    robot_inputs = []
    robot_inputs << InputParsers::Robot.new("(0, 0, E) FLFRFFLFFLFRF")
    robot_inputs << InputParsers::Robot.new("(2, 2, E) LFFFFFF")
    robot_inputs << InputParsers::Robot.new("(1, 0, N) FRFLFRFLFRFL")
    robot_inputs << InputParsers::Robot.new("(0, 1, W) F")

    expected_output = "(2, 4, N)\n(2, 8, N)\n(4, 3, N)\n(0, 1, W) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(world_input:, robot_inputs:).simulate
    end
  end
end
