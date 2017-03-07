class Operator

  attr_reader :current_rover, :plateau

  def initialize
    @current_rover ||= nil
    @plateau ||= nil
  end

  def deploy(rover)
    @current_rover = rover
  end

  def get_surface(plateau)
    @plateau = plateau
  end

  def receive(commands)
    commands.each_char { |command| send command }
  end

  private

  def send(command)
    case command
    when "L"
      current_rover.turn_left
    when "R"
      current_rover.turn_right
    when "M"
      current_rover.move
    else
      puts "Invalid character in the move sequence!"
      exit
    end
  end
end
