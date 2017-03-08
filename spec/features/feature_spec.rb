require 'spec_helper'

describe 'Features' do

  it 'controller can deploy the first vehicle' do
    operator = Operator.new
    surface = Surface.new(width: 5, height: 5)
    vehicle = Vehicle.new(x_coord: 1, y_coord: 2, heading: :N, surface: surface)
    operator.get_surface(surface)
    expect(operator.current_surface.width).to eq surface.width
    expect(operator.current_surface.height).to eq surface.height
    operator.deploy(vehicle)
    expect(operator.current_vehicle.x_coord).to eq(1)
    expect(operator.current_vehicle.y_coord).to eq(2)
    expect(operator.current_vehicle.heading).to eq(:N)
    operator.process_input('LMLMLMLMM')
    operator.get_position
    expect(operator.current_vehicle.establish_location).to eq '1 3 N'
  end

  it 'controller can deploy the second vehicle' do
    operator = Operator.new
    surface = Surface.new(width: 5, height: 5)
    vehicle = Vehicle.new(x_coord: 3, y_coord: 3, heading: :E, surface: surface)
    operator.get_surface(surface)
    expect(operator.current_surface.width).to eq surface.width
    expect(operator.current_surface.height).to eq surface.height
    operator.deploy(vehicle)
    expect(operator.current_vehicle.x_coord).to eq(3)
    expect(operator.current_vehicle.y_coord).to eq(3)
    expect(operator.current_vehicle.heading).to eq(:E)
    operator.process_input('MMRMMRMRRM')
    operator.get_position
    expect(operator.current_vehicle.establish_location).to eq '5 1 E'
  end
end
