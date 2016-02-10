require 'rails_helper'

RSpec.describe Host do
  let(:layer)   { 'physical' }
  let(:subj)    { 'system' }
  let(:name)    { 'load_average' }

  subject(:measurement) do
    Measurement.new layer:     layer,
                    subject:   subj,
                    name:      name,
                    value:     1,
                    timestamp: Time.now
  end

  describe '#metric' do
    it 'returns a Metric' do
      expect(measurement.metric).to be_a(Metric)
      expect(measurement.metric.layer).to eq(layer)
      expect(measurement.metric.subject).to eq(subj)
      expect(measurement.metric.name).to eq(name)
    end
  end
end
