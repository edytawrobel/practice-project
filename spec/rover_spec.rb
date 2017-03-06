require 'spec_helper'
require 'rover'

describe Rover do
  let(:rover) { described_class.new(x_coord: 0, y_coord: 0) }

  context "on initialization" do
    it "has x-coordinates" do
      expect(rover.x_coord).to eq 0
    end

    it "has y-coordinates" do
      expect(rover.y_coord).to eq 0
    end
  end
end
