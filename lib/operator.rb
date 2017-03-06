class Operator

  attr_reader :current_rover, :current_plateau

  def initialize(plateau, rover)
    @current_plateau = plateau
    @current_rover = rover
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
