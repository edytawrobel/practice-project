require './lib/operator.rb'
require './lib/plateau.rb'
require './lib/rover.rb'

plateau = Plateau.new(width: 5, height: 5)
rover = Rover.new(x_coord: 0, y_coord: 0, heading: :N)
operator = Operator.new(plateau, rover)
