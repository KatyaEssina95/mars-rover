class Position
  ORIENTATIONS = ["N", "E", "S", "W"]

  attr_accessor :x, :y, :orientation

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def translate(x, y)
    @x += x
    @y += y
  end

  def rotate_clockwise
    current_index = ORIENTATIONS.find_index(orientation)
    @orientation = ORIENTATIONS.last == orientation ? ORIENTATIONS.first : ORIENTATIONS[current_index + 1]
  end

  def rotate_anticlockwise
    current_index = ORIENTATIONS.find_index(orientation)
    @orientation = ORIENTATIONS.first == orientation ? ORIENTATIONS.last : ORIENTATIONS[current_index - 1]
  end

  def format
    "(#{x}, #{y}, #{orientation})"
  end
end
