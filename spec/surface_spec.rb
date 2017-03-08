require 'spec_helper'

describe Surface do
  let(:surface) { described_class.new(width: 5, height: 5) }

  context 'on initialization' do
    it 'has a width attribute' do
      expect(surface.width).to eq 5
    end

    it 'has a height attribute' do
      expect(surface.height).to eq 5
    end
  end
end
