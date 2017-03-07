require 'spec_helper'

describe Operator do

    let(:operator) { described_class.new }
    let(:plateau) { double :plateau, width: 5, height: 5 }
    let(:rover) { double :rover, x_coord: 0, y_coord: 0, turn_left: nil, turn_right: nil, move: nil }

  describe "#deploy" do
    it "has a rover" do
      operator.deploy(rover)
      expect(operator.current_rover).to eq rover
    end
  end

  describe "#get_surface" do
    it "has a plateau" do
      operator.get_surface(plateau)
      expect(operator.plateau).to eq plateau
    end
  end

  context "processing input LRM" do

    xit "instructs a rover to turn left" do
      allow(current_rover).to receive(:turn_left)
      operator.receive('L')
    end

    xit "instructs a rover to turn right" do
      allow(rover).to receive(:turn_right)
      operator.receive('R')
    end

    xit "instructs a rover to move forward" do
      allow(rover).to receive(:move)
      operator.receive('M')
    end

    xit "moves a rover twice forward when instructions are \"MM\"" do
      allow(rover).to receive(:move).twice
      operator.receive('MM')
    end

    xit "moves a rover in various directions" do
      allow(rover).to receive(:move).twice
      allow(rover).to receive(:turn_left)
      allow(rover).to receive(:turn_right)
      allow(rover).to receive(:move)
      allow(rover).to receive(:move)
      operator.receive('MMLRMM')
    end

    xit "receives an invalid command and throws error" do
      expect { operator.receive('W') }.to raise_error "Invalid character in the move sequence!"
    end
  end

end
