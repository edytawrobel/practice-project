class Rover

  attr_reader :x_coord, :y_coord

  def initialize(args)
    @x_coord = args[:x_coord]
    @y_coord = args[:y_coord]
  end
end
