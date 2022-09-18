require "test_helper"
require "position"

class PositionTest < Minitest::Test
  def test_translate_north
    position = Position.new(0, 0, "N")
    x_translate = 0
    y_translate = 1

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_translate_east
    position = Position.new(0, 0, "N")
    x_translate = 1
    y_translate = 0

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_translate_south
    position = Position.new(0, 0, "N")
    x_translate = 0
    y_translate = -1

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_translate_west
    position = Position.new(0, 0, "N")
    x_translate = -1
    y_translate = 0

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_translate_north_east
    position = Position.new(0, 0, "N")
    x_translate = 1
    y_translate = 1

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_translate_south_west
    position = Position.new(0, 0, "N")
    x_translate = -1
    y_translate = -1

    position.translate(x_translate, y_translate)

    assert_equal x_translate, position.x
    assert_equal y_translate, position.y
  end

  def test_rotate_clockwise_north
    position = Position.new(0, 0, "N")

    position.rotate_clockwise

    assert_equal "E", position.orientation
  end

  def test_rotate_anticlockwise_north
    position = Position.new(0, 0, "N")

    position.rotate_anticlockwise

    assert_equal "W", position.orientation
  end

  def test_rotate_clockwise_east
    position = Position.new(0, 0, "E")

    position.rotate_clockwise

    assert_equal "S", position.orientation
  end

  def test_rotate_anticlockwise_east
    position = Position.new(0, 0, "E")

    position.rotate_anticlockwise

    assert_equal "N", position.orientation
  end

  def test_rotate_clockwise_south
    position = Position.new(0, 0, "S")

    position.rotate_clockwise

    assert_equal "W", position.orientation
  end

  def test_rotate_anticlockwise_south
    position = Position.new(0, 0, "S")

    position.rotate_anticlockwise

    assert_equal "E", position.orientation
  end

  def test_rotate_clockwise_west
    position = Position.new(0, 0, "W")

    position.rotate_clockwise

    assert_equal "N", position.orientation
  end

  def test_rotate_anticlockwise_west
    position = Position.new(0, 0, "W")

    position.rotate_anticlockwise

    assert_equal "S", position.orientation
  end
end
