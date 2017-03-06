class Operator

  attr_reader :current_rover, :current_plateau

  def initialize(plateau, rover)
    @current_plateau = plateau
    @current_rover = rover
  end
end
