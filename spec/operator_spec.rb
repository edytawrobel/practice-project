require 'spec_helper'

describe Operator do

    let(:operator) { described_class.new }
    let(:plateau) { double :plateau, width: 5, height: 5 }
    let(:rover) { double :rover, x_coord: 0, y_coord: 0, turn_left: nil, turn_right: nil, move: nil }

  describe '#deploy' do
    it 'has a rover' do
      operator.deploy(rover)
      expect(operator.current_rover).to eq rover
    end
  end

  describe '#get_surface' do
    it 'has a plateau' do
      operator.get_surface(plateau)
      expect(operator.plateau).to eq plateau
    end
  end
end
