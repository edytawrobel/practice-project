require 'spec_helper'

describe Operator do

    let(:operator) { described_class.new }
    let(:surface) { double :surface, width: 5, height: 5 }
    let(:vehicle) { double :vehicle, x_coord: 0, y_coord: 0 }

  describe '#deploy' do
    it 'can operate a vehicle' do
      operator.deploy(vehicle)
      expect(operator.current_vehicle).to eq vehicle
    end
  end

  describe '#get_surface' do
    it 'has a plateau' do
      operator.get_surface(surface)
      expect(operator.current_surface).to eq surface
    end
  end
end
