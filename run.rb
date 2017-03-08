require './lib/operator.rb'
require './lib/surface.rb'
require './lib/vehicle.rb'

surface = Surface.new(width: 5, height: 5)
vehicle1 = Vehicle.new(x_coord: 1, y_coord: 2, heading: :N, surface: surface)
vehicle2 = Vehicle.new(x_coord: 3, y_coord: 3, heading: :E, surface: surface)
operator = Operator.new

puts "vehicle1 is at:", vehicle1.establish_location
operator.get_surface(surface)
operator.deploy(vehicle1)

puts "vehicle1 processing operator's instructions:", operator.process_input('LMLMLMLMM')
puts "operator confirms vehicle's number one location:", operator.get_position

puts
puts

puts "vehicle2 is at:", vehicle2.establish_location
operator.get_surface(surface)
operator.deploy(vehicle2)
puts "vehicle2 processing operator's instructions:", operator.process_input('MMRMMRMRRM')
puts "operator confirms vehicle2's number two location:", operator.get_position
