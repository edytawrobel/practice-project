require 'spec_helper'
# require 'plateau'

describe Plateau do
  let(:plateau) { described_class.new(width: 5, height: 5) }

  context "on initialization" do
    it "has a width attribute" do
      expect(plateau.width).to eq 5
    end

    it "has a height attribute" do
      expect(plateau.height).to eq 5
    end
  end
end
