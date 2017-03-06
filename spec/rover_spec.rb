require 'spec_helper'
require 'rover'

describe Rover do
  let(:rover) { described_class.new(x_coord: 0, y_coord: 0, heading: :N) }

  context "on initialization" do
    it "has x-coordinates" do
      expect(rover.x_coord).to eq 0
    end

    it "has y-coordinates" do
      expect(rover.y_coord).to eq 0
    end

    it "heads in a certain direction" do
      expect(rover.heading).to eq :N
    end
  end

  it 'can return its own coordinates and heading' do
    expect(rover.confirm_position).to eq '0 0 N'
  end

  context "turning sides" do
    it "can turn left" do
      rover.turn_left
      expect(rover.heading).to eq(:W)
    end

    it "can turn right" do
      rover.turn_right
      expect(rover.heading).to eq(:E)
    end
  end
end
