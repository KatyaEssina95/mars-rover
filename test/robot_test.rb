require "test_helper"
require "robot"
require "world"

class RobotTest < Minitest::Test
  def test_initial_lost_robot_raises_exception
    assert_raises do
      Robot.new(-1, -1, "N", world)
    end
  end

  def test_print_position
    robot = Robot.new(1, 1, "N", world)

    assert_output("(1, 1, N)\n") do
      robot.print_position
    end
  end

  def test_print_position_lost
    robot = Robot.new(0, 0, "S", world)
    robot.move("F") # New coordinates will be (0, -1)

    assert_output("(0, 0, S) LOST\n") do
      robot.print_position
    end
  end

  def test_move_up
    robot = Robot.new(0, 0, "N", world)

    robot.move("F" * 10)

    refute robot.is_lost?
    assert_equal 0, robot.position.x
    assert_equal 10, robot.position.y
  end

  def test_move_right
    robot = Robot.new(0, 0, "E", world)

    robot.move("F" * 10)

    refute robot.is_lost?
    assert_equal 10, robot.position.x
    assert_equal 0, robot.position.y
  end

  def test_move_diagonal
    robot = Robot.new(0, 0, "N", world)

    robot.move("FRFL" * 10)

    refute robot.is_lost?
    assert_equal 10, robot.position.x
    assert_equal 10, robot.position.y
  end

  def test_move_rotation_only
    robot = Robot.new(0, 0, "N", world)

    robot.move("R" * 3)

    refute robot.is_lost?
    assert_equal "W", robot.position.orientation
  end

  def test_move_nowhere
    robot = Robot.new(0, 0, "N", world)
    start_position = robot.position

    robot.move("")

    refute robot.is_lost?
    assert_equal start_position, robot.position
  end

  def test_move_up_lost
    robot = Robot.new(0, 0, "N", world)

    robot.move("F" * 11) # World is 10 X 10

    assert robot.is_lost?
    assert_equal world.max_y, robot.position.y
  end

  def test_move_right_lost
    robot = Robot.new(0, 0, "E", world)

    robot.move("F" * 11) # World is 10 X 10

    assert robot.is_lost?
    assert_equal world.max_x, robot.position.x
  end

  def test_move_diagonally_lost
    robot = Robot.new(0, 0, "N", world)

    robot.move("FRFL" * 11) # World is 10 X 10

    assert robot.is_lost?
    assert_equal world.max_x, robot.position.x
    assert_equal world.max_y, robot.position.y
  end

  def test_move_lost_position_unchanged
    robot = Robot.new(0, 0, "N", world)

    robot.move("FRFL" * 100) # World is 10 X 10

    assert robot.is_lost?
    assert_equal world.max_x, robot.position.x
    assert_equal world.max_y, robot.position.y
  end

  private

  def world
    World.new(10, 10)
  end
end
