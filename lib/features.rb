require './lib/operator.rb'
require './lib/plateau.rb'
require './lib/rover.rb'

plateau = Plateau.new(width: 5, height: 5)
rover1 = Rover.new(x_coord: 1, y_coord: 2, heading: :N, plateau: plateau)
rover2 = Rover.new(x_coord: 3, y_coord: 3, heading: :E, plateau: plateau)


puts "Here is the output, as requested:"
puts "rover1:", rover1.receive('LMLMLMLMM')
puts "rover2:", rover2.receive('MMRMMRMRRM')
