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

end
