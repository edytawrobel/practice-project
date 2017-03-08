class Vehicle

  attr_accessor :x_coord, :y_coord, :heading, :surface

  COMPASS = [:N, :W, :S, :E]

  def initialize(args)
    @x_coord = args[:x_coord]
    @y_coord = args[:y_coord]
    @heading = args[:heading]
    @surface = args[:surface]
  end

  def establish_location
    confirm_position
  end

  def turn_left
    @heading = turn('left')
  end

  def turn_right
    @heading = turn('right')
  end

  def move
    step_forward
  end

  private

  def confirm_position
    "#{@x_coord} #{@y_coord} #{@heading}"
  end

  def turn(side)
    index = COMPASS.find_index(@heading)
    return COMPASS[(index - 1) % 4] if side == 'right'
    return COMPASS[(index + 1) % 4] if side == 'left'
  end

  def step_forward
    case @heading
    when :N then @y_coord +=  1 if @y_coord < surface.height
    when :S then @y_coord -=  1 if @y_coord > 0
    when :E then @x_coord +=  1 if @x_coord < surface.width
    when :W then @x_coord -=  1 if @x_coord > 0
    end
  end
end
