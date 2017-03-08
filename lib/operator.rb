class Operator

  attr_reader :current_vehicle, :current_surface

  def initialize
    @current_vehicle ||= nil
    @current_surface ||= nil
  end

  def deploy(vehicle)
    @current_vehicle = vehicle
  end

  def get_surface(surface)
    @current_surface = surface
  end

end
