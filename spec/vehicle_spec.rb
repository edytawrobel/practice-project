require 'spec_helper'

describe Vehicle do

  let(:surface) { double :surface, width: 5, height: 5 }
  let(:vehicle) { described_class.new(x_coord: 0, y_coord: 0, heading: :N, surface: surface) }

  context 'on initialization' do
    it 'has x-coordinates' do
      expect(vehicle.x_coord).to eq 0
    end

    it 'has y-coordinates' do
      expect(vehicle.y_coord).to eq 0
    end

    it 'heads in a certain direction' do
      expect(vehicle.heading).to eq :N
    end

    it 'is deployed on a certain surface' do
      expect(vehicle.surface).to eq surface
    end
  end

  it 'can return its own coordinates and heading' do
    expect(vehicle.establish_location).to eq '0 0 N'

  end

  context 'turning sides' do
    it 'can turn left' do
      vehicle.turn_left
      expect(vehicle.heading).to eq(:W)
    end

    it 'can turn right' do
      vehicle.turn_right
      expect(vehicle.heading).to eq(:E)
    end
  end

  context 'changing directions' do
    it 'can change from left to right without moving' do
      vehicle.turn_left
      vehicle.turn_right
      expect(vehicle.establish_location).to eq '0 0 N'
    end

    it 'can spin around anticlockwise' do
      vehicle.turn_left
      vehicle.turn_left
      vehicle.turn_left
      vehicle.turn_left
      expect(vehicle.establish_location).to eq '0 0 N'
    end

    it 'can spin around clockwise' do
      vehicle.turn_right
      vehicle.turn_right
      vehicle.turn_right
      vehicle.turn_right
      expect(vehicle.establish_location).to eq '0 0 N'
    end
  end

  describe '#move' do
    it 'can move forward' do
      vehicle.move
      expect(vehicle.establish_location).to eq '0 1 N'
    end

    it 'can move forwards and turn right twice' do
      vehicle.move
      vehicle.turn_right
      vehicle.turn_right
      expect(vehicle.establish_location).to eq '0 1 S'
    end
  end
end
