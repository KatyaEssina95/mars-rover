require "test_helper"
require "mars_rover"

class MarsRoverTest < Minitest::Test
  def test_simulate_1
    # Example input
    inputs = [
      "4 8\n",
      "(2, 3, E) LFRFF\n",
      "(0, 2, N) FFLFRFF"
    ]

    file = create_temp_file(inputs.join)

    # Example output
    expected_output = "(4, 4, E)\n(0, 4, W) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(file.path).simulate
    end
  end

  def test_simulate_2
    # Second example input
    inputs = [
      "4 8\n",
      "(2, 3, N) FLLFR\n",
      "(1, 0, S) FFRLF"
    ]

    file = create_temp_file(inputs.join)

    # Second example output
    expected_output = "(2, 3, W)\n(1, 0, S) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(file.path).simulate
    end
  end

  def test_simulate_3
    # 4 robots: 3 in range, 1 lost
    # Robot 1 (random): start = (0, 0, E), end = (2, 4, N) movement = FLFRFFLFFLFRF
    # Robot 2 (straight up): start = (2, 2, E), end = (2, 8, N), movement = LFFFFFF
    # Robot 3 (diagonal): start = (1, 0, N), end = (4, 3, N), movement = FRFLFRFLFRFL
    # Robot 4 (lost): start = (0, 1, W), end = (0, 1, W), movement = F

    inputs = [
      "10 10\n",
      "(0, 0, E) FLFRFFLFFLFRF\n",
      "(2, 2, E) LFFFFFF\n",
      "(1, 0, N) FRFLFRFLFRFL\n",
      "(0, 1, W) F"
    ]

    file = create_temp_file(inputs.join)

    expected_output = "(2, 4, N)\n(2, 8, N)\n(4, 3, N)\n(0, 1, W) LOST\n"
    assert_output(expected_output) do
      MarsRover.new(file.path).simulate
    end
  end

  private

  def create_temp_file(input_string)
    file = Tempfile.new(["test", ".txt"])
    file.write(input_string)
    file.close
    file
  end
end
