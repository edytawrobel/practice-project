require 'spec_helper'

describe Operator do

    let(:operator) { described_class.new() }
    let(:surface) { double :surface }
    let(:vehicle) { double :vehicle, surface: surface }

  describe '#deploy' do
    it 'can operate a vehicle' do
      operator.deploy(vehicle)
      expect(operator.current_vehicle).to eq vehicle
      expect(operator.current_vehicle.surface).to eq surface
    end
  end

  context 'processing input LRM' do

    describe 'unsuccessfull operation' do
      it 'cannot operate if there is no surface' do
        expect { operator.process_input('LMLMLMLMM') }.to raise_error 'Cannot proceed: deploy vehicle first!'
      end
    end

    describe 'successfull operation' do

      before :each do
        operator.deploy(vehicle)
      end

      it 'instructs a rover to turn left' do
        allow(vehicle).to receive(:turn_left)
        operator.process_input('L')
      end

      it 'instructs a rover to turn right' do
        allow(vehicle).to receive(:turn_right)
        operator.process_input('R')
      end

      it 'instructs a rover to move forward' do
        allow(vehicle).to receive(:move)
        operator.process_input('M')
      end
    end
  end
end
