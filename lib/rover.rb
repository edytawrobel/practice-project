class Rover

  attr_accessor :x_coord, :y_coord, :heading, :plateau

  COMPASS = [:N, :W, :S, :E]

  def initialize(args)
    @x_coord = args[:x_coord]
    @y_coord = args[:y_coord]
    @heading = args[:heading]
    @plateau = args[:plateau]
  end

  def receive(commands)
    commands.each_char { |command| send command }
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
    case heading
    when :N then @y_coord +=  1 if @y_coord < plateau.height
    when :S then @y_coord -=  1 if @y_coord > 0
    when :E then @x_coord +=  1 if @x_coord < plateau.width
    when :W then @x_coord -=  1 if @x_coord > 0
    end
  end

  def send(command)
    case command
      when 'L'
        turn_left
      when 'R'
        turn_right
      when 'M'
        move
    end
  end
end
