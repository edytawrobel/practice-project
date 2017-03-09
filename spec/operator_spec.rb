require 'spec_helper'

describe Operator do

    let(:operator) { described_class.new() }
    let(:surface) { double :surface }
    let(:vehicle) { double :vehicle }

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

  context "processing input LRM" do

    describe "unsuccessfull operation" do
      it 'cannot operate if there is no surface' do
        operator.deploy(vehicle)
        expect { operator.process_input('LMLMLMLMM') }.to raise_error 'Cannot proceed: no vehicle or no surface'
      end

      it 'cannot operate if there is no vehicle' do
        operator.get_surface(surface)
        expect { operator.process_input('LMLMLMLMM') }.to raise_error 'Cannot proceed: no vehicle or no surface'
      end
    end

    describe "successfull operation" do

      before :each do
        operator.get_surface(surface)
        operator.deploy(vehicle)
      end

      it "instructs a rover to turn left" do
        allow(vehicle).to receive(:turn_left)
        operator.process_input('L')
      end

      it "instructs a rover to turn right" do
        allow(vehicle).to receive(:turn_right)
        operator.process_input('R')
      end

      it "instructs a rover to move forward" do
        allow(vehicle).to receive(:move)
        operator.process_input('M')
      end
    end
  end
end
