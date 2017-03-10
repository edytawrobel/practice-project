class Operator

  attr_reader :current_vehicle

  def initialize
    @current_vehicle ||= nil
  end

  def deploy(vehicle)
    @current_vehicle = vehicle
  end

  def process_input(commands)
    raise 'Cannot proceed: deploy vehicle first!' unless vehicle_deployed?
    commands.each_char { |command| send command }
  end

  def get_position
    self.current_vehicle.establish_location
  end

  private

  def vehicle_deployed?
    @current_vehicle != nil
  end

  def send(command)
    case command
      when 'L'
        @current_vehicle.turn_left
      when 'R'
        @current_vehicle.turn_right
      when 'M'
        @current_vehicle.move
    end
  end

end
