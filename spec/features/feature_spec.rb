require 'spec_helper'

describe 'Features' do

  it 'controller can deploy the first rover' do
    operator = Operator.new
    plateau = Plateau.new(width: 5, height: 5)
    rover = Rover.new(x_coord: 1, y_coord: 2, heading: :N, plateau: plateau)
    operator.get_surface(plateau)
    expect(operator.current_surface.width).to eq plateau.width
    expect(operator.current_surface.height).to eq plateau.height
    operator.deploy(rover)
    expect(operator.current_vehicle.x_coord).to eq(1)
    expect(operator.current_vehicle.y_coord).to eq(2)
    expect(operator.current_vehicle.heading).to eq(:N)
    operator.process_input('LMLMLMLMM')
    operator.get_position
    expect(operator.current_vehicle.confirm_position).to eq '1 3 N'
  end

  it 'controller can deploy the second rover' do
    operator = Operator.new
    plateau = Plateau.new(width: 5, height: 5)
    rover = Rover.new(x_coord: 3, y_coord: 3, heading: :E, plateau: plateau)
    operator.get_surface(plateau)
    expect(operator.current_surface.width).to eq plateau.width
    expect(operator.current_surface.height).to eq plateau.height
    operator.deploy(rover)
    expect(operator.current_vehicle.x_coord).to eq(3)
    expect(operator.current_vehicle.y_coord).to eq(3)
    expect(operator.current_vehicle.heading).to eq(:E)
    operator.process_input('MMRMMRMRRM')
    operator.get_position
    expect(operator.current_vehicle.confirm_position).to eq '5 1 E'
  end
end
