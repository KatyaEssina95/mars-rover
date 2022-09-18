require_relative "world"
require_relative "robot"
require_relative "file_reader"
require_relative "input_parsers/robot"
require_relative "input_parsers/world"

class MarsRover
  attr_reader :world_input, :robot_inputs

  def initialize(world_input:, robot_inputs:)
    @world_input = world_input
    @robot_inputs = robot_inputs
  end

  def simulate
    world = World.new(world_input.max_y, world_input.max_x)
    robot_inputs.each do |robot_input|
      robot = Robot.new(robot_input.x, robot_input.y, robot_input.orientation, world)
      robot.move(robot_input.movement_sequence)
      robot.print_position
    end
  end
end
