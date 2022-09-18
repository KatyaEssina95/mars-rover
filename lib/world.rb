class World
  attr_reader :max_y, :max_x, :min_y, :min_x

  def initialize(max_y, max_x)
    @max_y = max_y.to_i
    @max_x = max_x.to_i
    @min_y = @min_x = 0
  end
end
