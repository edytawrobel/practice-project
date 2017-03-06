require 'spec_helper'
require 'operator'

describe Operator do

    let(:operator) { described_class.new(plateau, rover) }
    let(:plateau) { double :plateau, width: 5, height: 5 }
    let(:rover) { double :rover, x_coord: 0, y_coord: 0, turn_left: nil, turn_right: nil, move: nil }

  context "on initialization" do
    it "has some plateau" do
      expect(operator.current_plateau).to eq plateau
    end

    it "has a rover" do
      expect(operator.current_rover).to eq rover
    end
  end

  context "processing input LRM" do

    it "instructs a rover to turn left" do
      allow(rover).to receive(:turn_left)
      operator.receive('L')
    end

    it "instructs a rover to turn right" do
      allow(rover).to receive(:turn_right)
      operator.receive('R')
    end

    it "instructs a rover to move forward" do
      allow(rover).to receive(:move)
      operator.receive('M')
    end

    it "moves a rover twice forward when instructions are \"MM\"" do
      allow(rover).to receive(:move).twice
      operator.receive('MM')
    end

    it "moves a rover in various directions" do
      allow(rover).to receive(:move).twice
      allow(rover).to receive(:turn_left)
      allow(rover).to receive(:turn_right)
      allow(rover).to receive(:move)
      allow(rover).to receive(:move)
      operator.receive('MMLRMM')
    end
  end

end
