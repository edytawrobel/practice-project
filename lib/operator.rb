class Operator

  attr_reader :current_vehicle, :current_surface

  def initialize
    @current_surface ||= nil
    @current_vehicle ||= nil
  end

  def get_surface(surface)
    @current_surface = surface
  end

  def deploy(vehicle)
    @current_vehicle = vehicle
  end

  def process_input(commands)
    raise 'Cannot proceed: no vehicle or no surface' unless operation_ready
    commands.each_char { |command| send command }
  end

  def get_position
    self.current_vehicle.establish_location
  end

  private

  def operation_ready
    @current_surface != nil && @current_vehicle != nil
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
