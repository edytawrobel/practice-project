require 'spec_helper'

describe Rover do

  let(:plateau) { double :plateau, width: 5, height: 5 }
  let(:rover) { described_class.new(x_coord: 0, y_coord: 0, heading: :N, plateau: plateau) }

  context 'on initialization' do
    it 'has x-coordinates' do
      expect(rover.x_coord).to eq 0
    end

    it 'has y-coordinates' do
      expect(rover.y_coord).to eq 0
    end

    it 'heads in a certain direction' do
      expect(rover.heading).to eq :N
    end

    it 'is deployed on a certain surface' do
      expect(rover.plateau).to eq plateau
    end
  end

  it 'can return its own coordinates and heading' do
    expect(rover.establish_location).to eq '0 0 N'

  end

  context 'turning sides' do
    it 'can turn left' do
      rover.turn_left
      expect(rover.heading).to eq(:W)
    end

    it 'can turn right' do
      rover.turn_right
      expect(rover.heading).to eq(:E)
    end
  end

  context 'changing directions' do
    it 'can change from left to right without moving' do
      rover.turn_left
      rover.turn_right
      expect(rover.establish_location).to eq '0 0 N'
    end

    it 'can spin around anticlockwise' do
      rover.turn_left
      rover.turn_left
      rover.turn_left
      rover.turn_left
      expect(rover.establish_location).to eq '0 0 N'
    end

    it 'can spin around clockwise' do
      rover.turn_right
      rover.turn_right
      rover.turn_right
      rover.turn_right
      expect(rover.establish_location).to eq '0 0 N'
    end
  end

  describe '#move' do
    it 'can move forward' do
      rover.move
      expect(rover.establish_location).to eq '0 1 N'
    end

    it 'can move forwards and turn right twice' do
      rover.move
      rover.turn_right
      rover.turn_right
      expect(rover.establish_location).to eq '0 1 S'
    end
  end
end
