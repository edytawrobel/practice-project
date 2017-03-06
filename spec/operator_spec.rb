require 'spec_helper'
require 'operator'

describe Operator do

    let(:operator) { described_class.new(plateau, rover) }
    let(:plateau) { Plateau.new(width: 5, height: 5) }
    let(:rover) { Rover.new(x_coord: 0, y_coord: 0) }


  context "on initialization" do
    it "has some plateau" do
      expect(operator.current_plateau).to eq plateau
    end

    it "has a rover" do
      expect(operator.current_rover).to eq rover
    end
  end

end
