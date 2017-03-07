class Rover

  attr_reader :x_coord, :y_coord, :heading
  COMPASS = [:N, :W, :S, :E]

  def initialize(args)
    @x_coord = args[:x_coord]
    @y_coord = args[:y_coord]
    @heading = args[:heading]
    @plateau = args[:plateau]
  end

  def turn_left
    @heading = turn('left')
    confirm_position
  end

  def turn_right
    @heading = turn('right')
    confirm_position
  end

  def move
    if coordinates_valid? && heading_valid?
      step_forward
      confirm_position
    else
      puts "invalid commands"
    end
  end

  def confirm_position
    "#{@x_coord} #{@y_coord} #{@heading}"
  end

  private

  def turn(side)
     index = COMPASS.find_index(@heading)
     return COMPASS[(index - 1) % 4] if side == 'right'
     return COMPASS[(index + 1) % 4] if side == 'left'
  end

  def step_forward
    case @heading
    when :N then @y_coord +=  1
    when :S then @y_coord += -1
    when :E then @x_coord +=  1
    when :W then @x_coord += -1
    end
  end

  def coordinates_valid?
    x_coord.between?(0, @plateau.width) && y_coord.between?(0, @plateau.height)
  end

  def heading_valid?
    COMPASS.include?(heading)
  end

end
