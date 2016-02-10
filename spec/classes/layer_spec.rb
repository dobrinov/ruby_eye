require 'rails_helper'

RSpec.describe Layer do
  subject(:layer) { described_class }

  describe '.all' do
    it 'returns an Array' do
      expect(layer.all).to be_a(Array)
    end
  end

  describe '#metrics' do
    it 'retunrs an Array'
  end

  describe '#measurements' do
    it 'retunrs an Array'
  end
end
