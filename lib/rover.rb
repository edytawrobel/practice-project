class Rover

  attr_reader :x_coord, :y_coord, :heading
  COMPASS = [:N, :W, :S, :E]

  def initialize(args)
    @x_coord = args[:x_coord]
    @y_coord = args[:y_coord]
    @heading = args[:heading]
  end

  def confirm_position
    "#{@x_coord} #{@y_coord} #{@heading}"
  end

  def turn_left
    @heading = turn('left')
  end

  def turn_right
    @heading = turn('right')
  end

  def move
    case @heading
    when :N then @y_coord +=  1
    when :S then @y_coord += -1
    when :E then @x_coord +=  1
    when :W then @x_coord += -1
    end
  end

  private

  def turn(side)
     index = COMPASS.find_index(@heading)
     return COMPASS[index + 1] if side == 'left'
     return COMPASS[index - 1] if side == 'right'
  end
end
