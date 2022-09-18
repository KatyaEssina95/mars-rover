require_relative "position"

class Robot
  ORIENTATION_TRANSLATIONS = {
    "N": [0, 1],
    "E": [1, 0],
    "S": [0, -1],
    "W": [-1, 0]
  }

  attr_accessor :position, :world, :lost

  def initialize(x, y, orientation, world)
    @position = Position.new(x, y, orientation)
    @world = world
    @lost = false
    raise "Initial robot position (#{position.x}, #{position.y}) is out of bounds for world (#{world.max_x}, #{world.max_y})" unless in_bounds?
  end

  def print_position
    puts "#{position.format}#{" LOST" if is_lost?}"
  end

  def move(movement_sequence)
    movement_sequence.chars.each do |movement|
      break if is_lost?
      case movement
      when "F"
        position.translate(*translation)
        unless in_bounds?
          report_lost!
        end
      when "L"
        position.rotate_anticlockwise
      when "R"
        position.rotate_clockwise
      end
    end
  end

  def is_lost?
    lost
  end

  private

  def report_lost!
    @lost = true
    position.translate(*(translation.map{ |position| position * -1 })) # Record final position
  end

  def in_bounds?
    position.x.between?(world.min_x, world.max_x) && position.y.between?(world.min_y, world.max_y)
  end

  def translation
    ORIENTATION_TRANSLATIONS[position.orientation.to_sym]
  end
end
